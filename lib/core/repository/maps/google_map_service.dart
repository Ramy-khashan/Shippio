import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmap;
import '../../models/google_map_model.dart';
import 'map_service.dart';

class GoogleMapService implements MapService {
  gmap.GoogleMapController? _controller;

  @override
  Widget buildMap({
    required Function(PositionModel) onTap,

    Set<MarkerModel> markers = const {},
    Set<PolylineModel> polylines = const {},
  }) {
    return gmap.GoogleMap(
      mapType: gmap.MapType.terrain,
      initialCameraPosition: const gmap.CameraPosition(
        target: gmap.LatLng(30.036640871974726, 31.250067539513108),
        zoom: 15,
      ),
      onMapCreated: (controller) => _controller = controller,
      onTap: (position) => onTap(
        PositionModel(
          latitude: position.latitude,
          longitude: position.longitude,
        ),
      ),

      myLocationEnabled: false,
      myLocationButtonEnabled: false,

      zoomControlsEnabled: false,
      markers: markers.map((marker) => marker.marker).toSet(),
      polylines: polylines.map((polyline) => polyline.polyline).toSet(),
    );
  }

  @override
  void moveTo(PositionModel position) {
    try {
      _controller?.animateCamera(
        gmap.CameraUpdate.newLatLng(position.position),
      );
    } catch (_) {}
  }
}
