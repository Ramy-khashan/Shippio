import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controller/trip_process_bloc.dart';

class TripProcessScreen extends StatelessWidget {
  const TripProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TripProcessBloc controller = TripProcessBloc.get(context);
    return Scaffold(
      body: BlocBuilder<TripProcessBloc, TripProcessState>(
        builder: (context, state) {
          return GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: controller.kGooglePlex,
            onMapCreated: (GoogleMapController mapController) {
              controller.googleMapController.complete(mapController);
            },
          );
        },
      ),
    );
  }
}
