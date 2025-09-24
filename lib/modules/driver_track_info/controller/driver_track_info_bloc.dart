import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shippio/core/constant/app_colors.dart';
import 'package:shippio/core/models/directions_model.dart';
import 'package:shippio/core/repository/directions/directions_repository.dart';
import 'package:shippio/core/utils/functions/app_toast.dart';
import '../../../core/constant/app_enums.dart';
import '../../../core/constant/app_strings.dart';

part 'driver_track_info_event.dart';
part 'driver_track_info_state.dart';

class DriverTrackInfoBloc
    extends Bloc<DriverTrackInfoEvent, DriverTrackInfoState> {
  DriverTrackInfoBloc() : super(DriverTrackInfoState()) {
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
        startCap:Cap.roundCap,
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
          AppToast("Thers's no assign driver yet, Please Wait!");
        } else {
          await _changeCameraPosition(position: state.driverLocation!);
        }
        break;
    }
  }
}
