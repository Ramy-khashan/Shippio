import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shippio/modules/driver_track_info/controller/driver_track_info_bloc.dart';

import '../../../core/components/glass_card.dart';
import '../../../core/components/glassy_app_bar.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_enums.dart';
import 'widgets/marker_position.dart';

class DriverTrackInfoScreen extends StatelessWidget {
  const DriverTrackInfoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final DriverTrackInfoBloc controller = DriverTrackInfoBloc.get(context);
    return BlocBuilder<DriverTrackInfoBloc, DriverTrackInfoState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: GlassyAppBar(
            title: "",
            iconColor: AppColors.primaryColor,
            icon: Icons.arrow_back,
          ),
          body: Stack(
            children: [
              GoogleMap(
                mapType: MapType.terrain,
                polylines: state.polylines,
                initialCameraPosition: controller.cameraPosition,
                onMapCreated: (GoogleMapController mapController) {
                  if (!controller.googleMapController.isCompleted) {
                    controller.googleMapController.complete(mapController);
                  }
                },
                myLocationButtonEnabled: false,
                markers: state.markerSet,
              ),
              MarkerPosition(
                onPickUpPosition: () {
                  controller.add(
                    OnShowMarkerPositioneEven(position: Position.pickUp),
                  );
                },
                onDestinationPosition: () {
                  controller.add(
                    OnShowMarkerPositioneEven(position: Position.destination),
                  );
                },
                onDriverPosition: () {
                  controller.add(
                    OnShowMarkerPositioneEven(position: Position.driver),
                  );
                },
              ),
              if (state.distance.isNotEmpty && state.duration.isNotEmpty)
                SafeArea(
                  child: Align(
                    alignment: Alignment.topCenter,
                    
                    child: GlassCard(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),
                        child: Text(
                          "${state.distance} , ${state.duration}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
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
