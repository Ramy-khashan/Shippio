import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/models/directions_model.dart';

class PolylineParamModel {
  LatLng? driver;
  LatLng? destination;

  PolylineParamModel(this.driver, this.destination);
}

class PolylineModelInfo {
  Polyline polyline;
  Directions? polylineInfo;
    String ?totalDistance;
    String? totalDuration;
  PolylineModelInfo(
    this.polyline,
    this.polylineInfo,
    this.totalDistance,
    this.totalDuration,
  );
}
