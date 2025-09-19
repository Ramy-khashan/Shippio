import 'dart:async';

 import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'trip_process_event.dart';
part 'trip_process_state.dart';

class TripProcessBloc extends Bloc<TripProcessEvent, TripProcessState> {
  TripProcessBloc() : super(TripProcessInitial()) {
    on<TripProcessEvent>((event, emit) {});
  }
  static TripProcessBloc get(context) => BlocProvider.of(context);
  final Completer<GoogleMapController> googleMapController =
      Completer<GoogleMapController>();

  CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  CameraPosition kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );
  Future<void> goToTheLake() async {
     final GoogleMapController controller = await googleMapController.future;
    await controller.moveCamera(CameraUpdate.newCameraPosition(kLake));
  }
}
