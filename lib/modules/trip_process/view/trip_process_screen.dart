import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shippio/core/components/app_button.dart';
import 'package:shippio/core/components/loading_item.dart';
import 'package:shippio/core/constant/app_colors.dart';
import 'package:shippio/core/constant/app_enums.dart';

import '../../../core/components/glassy_app_bar.dart';
import '../controller/trip_process_bloc.dart';

class TripProcessScreen extends StatelessWidget {
  const TripProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TripProcessBloc controller = TripProcessBloc.get(context);
    return BlocBuilder<TripProcessBloc, TripProcessState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: GlassyAppBar(
            onPress: () {
              controller.add(OnNavigationBackEvent(context: context));
            },
            title: "",
            iconColor: AppColors.primaryColor,
            icon: Icons.arrow_back,
          ),
          body: Stack(
            children: [
              GoogleMap(
                mapType: MapType.terrain,
                initialCameraPosition: controller.cameraPosition,
                onMapCreated: (GoogleMapController mapController) {
                  if (!controller.googleMapController.isCompleted) {
                    controller.googleMapController.complete(mapController);
                  }
                },
                myLocationButtonEnabled: false,
                markers: state.markerSet,
                onTap: (LatLng latLng) {
                  controller.add(
                    SetMarkerEvent(
                      markerPlace: latLng,
                      markerType: state.tripProcess,
                    ),
                  );
                },
              ),
              if (state.tripProcess == TripProcessEnum.pickUpDetails ||
                  state.tripProcess == TripProcessEnum.distnationDetails)
                Positioned(
                  bottom: 0,
                  left: 20,
                  right: 20,
                  child: SafeArea(
                    child: state.getAddressStatus == RequestStatus.loading
                        ? LoadingItem()
                        : Row(
                            children: [
                              if (state.tripProcess ==
                                      TripProcessEnum.distnationDetails ||
                                  state.tripProcess ==
                                      TripProcessEnum.pickUpDetails)
                                Expanded(
                                  child: AppButton(
                                    width: 150,
                                    title: "Change",
                                    textColor: AppColors.redColor,
                                    onPressed: () {
                                      controller.add(
                                        OnChangeMarkerPlace(
                                          tripProcess:
                                              state.tripProcess ==
                                                  TripProcessEnum
                                                      .distnationDetails
                                              ? TripProcessEnum
                                                    .distnationLocation
                                              : state.tripProcess ==
                                                    TripProcessEnum
                                                        .pickUpDetails
                                              ? TripProcessEnum.pickUpLocation
                                              : state.tripProcess,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              SizedBox(width: 10),
                              Expanded(
                                child: AppButton(
                                  width: 150,

                                  title: "Confirm Location",
                                  onPressed: () {
                                    controller.add(
                                      OnSubmitEvent(
                                        context: context,
                                        tripProcess: state.tripProcess,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
