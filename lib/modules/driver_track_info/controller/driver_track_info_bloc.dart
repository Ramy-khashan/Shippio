import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shippio/core/constant/app_colors.dart';
import 'package:shippio/core/models/directions_model.dart';
import 'package:shippio/core/repository/directions/directions_repository.dart';
import 'package:shippio/core/utils/functions/app_toast.dart';
import 'package:shippio/core/utils/functions/marker_prepare.dart';
import 'package:shippio/modules/driver_track_info/model/polyline_param_model.dart';
import '../../../core/constant/app_enums.dart';
import '../../../core/constant/app_strings.dart';
import '../view/widgets/driver_info.dart';

part 'driver_track_info_event.dart';
part 'driver_track_info_state.dart';

class DriverTrackInfoBloc
    extends Bloc<DriverTrackInfoEvent, DriverTrackInfoState> {
  DriverTrackInfoBloc() : super(DriverTrackInfoState()) {
    on<ShowDriverEven>(_showDriverBottonSheet);
    on<OnAssignDriverEven>(_assignDriver);
    on<GetMarkerAndPosition>(_setMarkerAndCamera);
    on<OnDrawPolylineEven>(_drowPolyline);
    on<OnShowMarkerPositioneEven>(_moveToPosition);
  }
  static DriverTrackInfoBloc get(BuildContext context) =>
      BlocProvider.of(context);

  final Completer<GoogleMapController> googleMapController =
      Completer<GoogleMapController>();
  CameraPosition cameraPosition = CameraPosition(
    target: LatLng(30.0444, 31.2357),
    zoom: 14,
  );
  _setMarkerAndCamera(GetMarkerAndPosition even, emit) {
    LatLng pickUpLocation = even.markers
        .where((marker) => marker.markerId.value == AppStrings.pickUp)
        .toList()
        .first
        .position;
    LatLng destinationLocation = even.markers
        .where((marker) => marker.markerId.value == AppStrings.deliverTo)
        .toList()
        .first
        .position;
    emit(
      state.copyWith(
        markerSet: even.markers,
        destinationLocation: destinationLocation,
        pickUpLocation: pickUpLocation,
      ),
    );

    _changeCameraPosition(position: destinationLocation);

    add(OnDrawPolylineEven());
  }

  Future _changeCameraPosition({required LatLng position}) async {
    final controller = await googleMapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 15),
      ),
      duration: Duration(milliseconds: 1000),
    );
  }

  _drowPolyline(OnDrawPolylineEven even, emit) async {
    Directions? polylineInfo = await DirectionsRepository().getDirections(
      origin: state.pickUpLocation!,
      destination: state.destinationLocation!,
    );
    if (polylineInfo != null) {
      Polyline polyline = Polyline(
        startCap: Cap.roundCap,
        polylineId: PolylineId(AppStrings.deliveryPath),
        color: AppColors.redColor,
        width: 6,
        points: polylineInfo.polylinePoints
            .map((val) => LatLng(val.latitude, val.longitude))
            .toList(),
      );
      emit(
        state.copyWith(
          polylines: {polyline},
          distance: polylineInfo.totalDistance,
          duration: polylineInfo.totalDuration,
        ),
      );
    }
  }

  _moveToPosition(OnShowMarkerPositioneEven even, emit) async {
    switch (even.position) {
      case Position.pickUp:
        await _changeCameraPosition(position: state.pickUpLocation!);
        break;
      case Position.destination:
        await _changeCameraPosition(position: state.destinationLocation!);
        break;
      case Position.driver:
        if (state.driverLocation == null) {
          add(ShowDriverEven(context: even.context));
        } else {
          await _changeCameraPosition(position: state.driverLocation!);
          if (even.context.mounted) {
            if (!isOpenDriverDialog) {
              add(ShowDriverEven(context: even.context));
            }
          }
        }
        break;
    }
  }

  _assignDriver(OnAssignDriverEven even, emit) async {
    try {
      emit(state.copyWith(getDriverStatus: RequestStatus.loading));
      String title = await compute(getDriverInfoIsolate, null);
      AppToast(title);
      Map driverData = await setDriverMarker(
        position: LatLng(30.052077506443368, 31.236343681812283),
      );

      emit(
        state.copyWith(
          getDriverStatus: RequestStatus.success,
          markerSet: driverData['markers'],
          polylines: driverData['polyline'],
          distance: driverData['distance'],
          duration: driverData['duration'],
          driverLocation: LatLng(30.052077506443368, 31.236343681812283),
        ),
      );
      if (even.context.mounted) {
        add(
          OnShowMarkerPositioneEven(
            position: Position.driver,
            context: even.context,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(getDriverStatus: RequestStatus.failed));
    }
  }

  bool isOpenDriverDialog = false;
  _showDriverBottonSheet(ShowDriverEven even, emit) async {
    isOpenDriverDialog = true;

    if (state.driverLocation == null) {
      add(OnAssignDriverEven(context: even.context));
    }
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      enableDrag: true,
      barrierColor: Colors.transparent,
      context: even.context,
      builder: (_) => BlocProvider.value(value: this, child: DriverInfo()),
    ).whenComplete(() {
      isOpenDriverDialog = false;
    });
  }

  Future<Map<String, dynamic>> setDriverMarker({
    required LatLng position,
  }) async {
    Set<Marker> markers = {...state.markerSet};
    Marker driver = Marker(
      markerId: MarkerId(AppStrings.driver),
      position: position,
      icon: MarkerIcons.driver,
    );
    markers.add(driver);
    PolylineModelInfo? polylineInfo = await compute(
      drawPolyline,
      PolylineParamModel(position, state.pickUpLocation),
    );

    return {
      "markers": markers,
      "polyline": polylineInfo == null ? null : {polylineInfo.polyline},
      "distance": polylineInfo?.totalDistance,
      "duration": polylineInfo?.totalDuration,
    };
  }
}

Future<String> getDriverInfoIsolate(dynamic _) async {
  await Future.delayed(Duration(seconds: 5));
  AppToast("Driver Assigned");
  return "Driver Assigned";
}

Future<PolylineModelInfo?> drawPolyline(PolylineParamModel location) async {
  Directions? polylineInfo = await DirectionsRepository().getDirections(
    origin: location.driver!,
    destination: location.destination!,
  );

  Polyline? polyline;
  if (polylineInfo != null) {
    polyline = Polyline(
      startCap: Cap.roundCap,
      polylineId: PolylineId(AppStrings.driverPath),
      color: AppColors.tertiaryColor,
      width: 6,
      points: polylineInfo.polylinePoints
          .map((val) => LatLng(val.latitude, val.longitude))
          .toList(),
    );
  }
  return PolylineModelInfo(
    polyline!,
    polylineInfo,
    polylineInfo?.totalDistance ?? "",
    polylineInfo?.totalDuration ?? "",
  );
}
