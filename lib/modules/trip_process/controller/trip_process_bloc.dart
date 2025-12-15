import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shippio/core/constant/app_colors.dart';
import 'package:shippio/core/constant/app_images.dart';
import 'package:shippio/modules/trip_process_parts/pages/confirm_trip/confirm_trip_bottom_sheet_part.dart';
import 'package:shippio/modules/trip_process_parts/pages/trip_pick_up/pick_up_bottom_sheet_part.dart';
import 'package:shippio/shippio_app.dart';
import '../../../config/router/router_keys.dart';
import '../../../core/components/glassy_show_bottom_sheet.dart';
import '../../../core/constant/app_enums.dart';
import '../../../core/constant/app_strings.dart';
import '../../../core/models/google_map_model.dart';
import '../../../core/repository/maps/map_service.dart';
import '../../../core/utils/functions/camil_case.dart';
import '../../../core/utils/functions/get_placemark_isolate.dart';
import '../../../core/utils/functions/marker_prepare.dart';
import '../../../core/utils/functions/service_locator.dart';
import '../../trip_process_parts/pages/payment_dialog/payment_dialog.dart';
import '../model/location_address_model.dart';
import '../model/payment_type_model.dart';
import '../model/vehicles_model.dart';
import '../../trip_process_parts/pages/trip_distnation/distnation_bottom_sheet_part.dart';
import '../../trip_process_parts/pages/schdule_selection/schedule_pick_time_bottom_sheet_part.dart';
import '../../trip_process_parts/pages/vehicles_selection/select_vehicle_bottom_sheet_part.dart';
part 'trip_process_event.dart';
part 'trip_process_state.dart';

class TripProcessBloc extends Bloc<TripProcessEvent, TripProcessState> {
  TripProcessBloc() : super(TripProcessState()) {
    on<PrepareMarkersEven>(_prepareMarks);
    on<SetMarkerEvent>(_onAddMark);
    on<OnSubmitEvent>(_onConfirmDetails);
    on<AddressEvent>(_getAddress);
    on<OnNavigationBackEvent>(_navigationBack);
    on<OnChangeMarkerPlace>(_changeMarker);
    on<OnSelectVehicleEvent>(_selectVehicle);
    on<OnSelectPaymentEvent>(_selectPayment);
    on<ShowSummaryEven>(_showSummary);
  }
  _prepareMarks(even, emit) async {
    if (ShippioApp.navigatorKey.currentContext != null) {
      await MarkerIcons.preload(ShippioApp.navigatorKey.currentContext!);
    }
  }

  static TripProcessBloc get(BuildContext context) => BlocProvider.of(context);
 
  late LocationAddressModel pickUpAddressInfo;
  late LocationAddressModel distnationAddressInfo;
 
  _onAddMark(SetMarkerEvent event, emit) async {
    emit(state.copyWith(updateStatus: UpdateStatus.start));
    MarkerModel? marker;
    if (event.markerType == TripProcessEnum.pickUpLocation) {
      marker = MarkerModel(
        markerId: AppStrings.pickUp,
        position: event.markerPlace,
        icon: MarkerIcons.pickUpIcon,
      );
      emit(state.copyWith(tripProcess: TripProcessEnum.pickUpDetails));
    } else if (event.markerType == TripProcessEnum.distnationLocation) {
      marker = MarkerModel(
        markerId: AppStrings.deliverTo,
        position: event.markerPlace,
        icon: MarkerIcons.destinationIcon,
      );

      emit(state.copyWith(tripProcess: TripProcessEnum.distnationDetails));
    }
    if (marker != null) {
      Set<MarkerModel> markersItems = {...state.markerSet};

      markersItems.removeWhere((m) => m.markerId == marker!.markerId);

      markersItems.add(marker);
      await _changeCameraPosition(event.markerPlace);
      emit(
        state.copyWith(updateStatus: UpdateStatus.end, markerSet: markersItems),
      );
    }
  }

  Future _changeCameraPosition(PositionModel latLng) async {
    sl.get<MapService>().moveTo(latLng);
    
  }

  Future<void> _getAddress(AddressEvent event, emit) async {
    try {
      emit(state.copyWith(getAddressStatus: RequestStatus.loading));

      List<Placemark> placemarks = await placemarkFromCoordinates(
        event.position.position.latitude,
        event.position.position.longitude,
      );
      final addressInfo = await compute(parsePlacemark, placemarks.first);
      if (event.markerType == TripProcessEnum.pickUpDetails) {
        pickUpAddressInfo = addressInfo;

        if (event.context.mounted) {
          await _openBottomSheet(
            event.context,
            PickUpBottomSheetPart(),
            onThen: (val) {
              if (val != null && val == true) {
                emit(
                  state.copyWith(
                    tripProcess: TripProcessEnum.distnationLocation,
                  ),
                );
              }
            },
          );
        }
      } else if (event.markerType == TripProcessEnum.distnationDetails) {
        distnationAddressInfo = addressInfo;
        if (event.context.mounted) {
          await _openBottomSheet(
            event.context,
            DistnationBottomSheetPart(),
            onThen: (val) {
              if (val != null && val == true) {
                emit(
                  state.copyWith(
                    tripProcess: TripProcessEnum.schedulePickupTime,
                  ),
                );
              }
            },
          );
        }
      }
      emit(state.copyWith(getAddressStatus: RequestStatus.success));
    } catch (e) {
      emit(state.copyWith(getAddressStatus: RequestStatus.failed));
    }
  }

  Future _openBottomSheet(
    BuildContext context,

    Widget widget, {
    Function(dynamic)? onThen,
  }) async {
    await showModalBottomSheet(
      scrollControlDisabledMaxHeightRatio: 1,
      enableDrag: false,
      isDismissible: false,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      showDragHandle: false,
      context: context,
      builder: (_) => GlassyShowBottomSheet(
        child: BlocProvider.value(
          value: this,
          child: PopScope(
            canPop: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 7,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,

                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                widget,
              ],
            ),
          ),
        ),
      ),
    ).then((val) {
      if (onThen != null) onThen(val);
    });
  }

  _onConfirmDetails(OnSubmitEvent event, emit) async {
    switch (event.tripProcess) {
      // case TripProcessEnum.init:
      //   break;
      case TripProcessEnum.pickUpLocation:
        break;
      case TripProcessEnum.pickUpDetails:
        add(
          AddressEvent(
            context: event.context,
            position: PositionModel.fromJson(
              state.markerSet
                  .firstWhere((marker) => marker.markerId.value == "pickUp")
                  .position,
            ),
            markerType: TripProcessEnum.pickUpDetails,
          ),
        );

        break;

      case TripProcessEnum.distnationLocation:
        break;
      case TripProcessEnum.distnationDetails:
        add(
          AddressEvent(
            context: event.context,
            position: PositionModel.fromJson(
              state.markerSet
                  .firstWhere((marker) => marker.markerId.value == "deliverTo")
                  .position,
            ),
            markerType: TripProcessEnum.distnationDetails,
          ),
        );

        break;
      case TripProcessEnum.schedulePickupTime:
        await _openBottomSheet(
          event.context,
          SchedulePickTimeBottomSheetPart(),
          onThen: (val) {
            if (val != null && val == true) {
              emit(
                state.copyWith(tripProcess: TripProcessEnum.tripVehicleType),
              );
            }
          },
        );

        break;
      case TripProcessEnum.tripVehicleType:
        await _openBottomSheet(
          event.context,
          SelectVehicleBottomSheetPart(),
          onThen: (val) {
            if (val != null && val == true) {
              emit(
                state.copyWith(tripProcess: TripProcessEnum.confirmationTrip),
              );
            }
          },
        );
        break;

      case TripProcessEnum.confirmationTrip:
        convertSummary();

        await _openBottomSheet(
          event.context,
          ConfirmTripBottomSheetPart(),
          onThen: (val) {
            if (val != null && val == true) {
              emit(state.copyWith(tripProcess: TripProcessEnum.selectPayment));
            }
          },
        );
        break;

      case TripProcessEnum.selectPayment:
        event.context.pushNamed(
          RouterKeys.driverTrackInfoScreen,
          extra: {'markers': state.markerSet},
        );
        break;

      // emit(state.copyWith(tripProcess: TripProcessEnum.selectPayment));
      //Preform payment method
      // await _openBottomSheet(event.context, ConfirmTripBottomSheetPart());
      // emit(state.copyWith(tripProcess: TripProcessEnum.driverInfo));
      // _openBottomSheet(event.context, SelectVehicleBottomSheetPart());
    }
  }

  _navigationBack(OnNavigationBackEvent event, emit) async {
    switch (state.tripProcess) {
      // case TripProcessEnum.init:
      //    if (event.context.mounted) { event.context.pop();}

      case TripProcessEnum.pickUpLocation:
        // emit(state.copyWith(tripProcess: TripProcessEnum.init));
        if (event.context.mounted) {
          event.context.pop();
        }
        break;

      case TripProcessEnum.pickUpDetails:
        emit(state.copyWith(tripProcess: TripProcessEnum.pickUpLocation));

        if (event.context.mounted) {
          event.context.pop();
        }
        break;

      case TripProcessEnum.distnationLocation:
        emit(state.copyWith(tripProcess: TripProcessEnum.pickUpDetails));

        await _openBottomSheet(event.context, PickUpBottomSheetPart());
        break;

      case TripProcessEnum.distnationDetails:
        if (event.context.mounted) {
          event.context.pop();
        }

        emit(state.copyWith(tripProcess: TripProcessEnum.distnationLocation));
        break;

      case TripProcessEnum.schedulePickupTime:
        if (event.context.mounted) {
          event.context.pop();
        }
        emit(state.copyWith(tripProcess: TripProcessEnum.distnationDetails));

        await _openBottomSheet(event.context, DistnationBottomSheetPart());
        break;

      case TripProcessEnum.tripVehicleType:
        if (event.context.mounted) {
          event.context.pop();
        }
        emit(state.copyWith(tripProcess: TripProcessEnum.schedulePickupTime));

        await _openBottomSheet(
          event.context,
          SchedulePickTimeBottomSheetPart(),
        );
        break;

      case TripProcessEnum.confirmationTrip:
        if (event.context.mounted) {
          event.context.pop();
        }
        emit(state.copyWith(tripProcess: TripProcessEnum.tripVehicleType));

        await _openBottomSheet(event.context, SelectVehicleBottomSheetPart());
        break;

      case TripProcessEnum.selectPayment:
        if (event.context.mounted) {
          event.context.pop();
        }
        emit(state.copyWith(tripProcess: TripProcessEnum.confirmationTrip));

        await _openBottomSheet(event.context, ConfirmTripBottomSheetPart());
        break;
    }
  }

  _changeMarker(OnChangeMarkerPlace event, emit) {
    emit(state.copyWith(tripProcess: event.tripProcess));
  }

  List<VehiclesModel> vehiclesList = [
    VehiclesModel(
      id: 1,
      title: "Bicycle Delivery",
      fees: "16.00",
      timeToDelivery: "60 min",
      image: AppImages.bicycle,
    ),
    VehiclesModel(
      id: 2,
      title: "Motorbike Delivery",
      fees: "20.00",
      timeToDelivery: "45 min",
      image: AppImages.motocycle,
    ),
    VehiclesModel(
      id: 3,
      title: "Car Delivery",
      fees: "34.00",
      timeToDelivery: "32 min",
      image: AppImages.car,
    ),
    VehiclesModel(
      id: 4,
      title: "Car-van Delivery",
      fees: "60.00",
      timeToDelivery: "25 min",
      image: AppImages.van,
    ),
  ];
  _selectVehicle(OnSelectVehicleEvent event, emit) {
    emit(state.copyWith(selectedVehicleId: event.vehicleId));
  }

  List<PaymentTypeModel> paymentsList = [
    PaymentTypeModel(
      title: "Paymob",
      image: AppImages.paymob,
      paymentType: PaymentTypeEnum.paymob,
    ),
    PaymentTypeModel(
      title: "Fawry",
      image: AppImages.fawry,
      paymentType: PaymentTypeEnum.fawry,
    ),
    PaymentTypeModel(
      title: "Stripe",
      image: AppImages.stripe,
      paymentType: PaymentTypeEnum.stripe,
    ),
  ];

  _selectPayment(OnSelectPaymentEvent event, emit) {
    emit(state.copyWith(selectedPayment: event.paymentType));
  }

  Map<String, dynamic> summaryMap = {
    "delivery": 800,
    "fees": 50,
    "payment_services": 10,
    "total_payment": 860,
  };
  List<Map<String, dynamic>> summarList = [];

  convertSummary() {
    summarList = [];
    summaryMap.forEach(
      (title, val) =>
          summarList.add({"title": camilCaseMethod(title), "value": val}),
    );
  }

  _showSummary(ShowSummaryEven even, emit) {
    emit(state.copyWith(updateStatus: UpdateStatus.start));
    convertSummary();
    emit(state.copyWith(updateStatus: UpdateStatus.end));

    _openBottomSheet(even.context, PaymentDialog());
  }
}
