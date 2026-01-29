 
import '../../../../core/models/directions_model.dart';
import '../../../../core/models/google_map_model.dart';

class PolylineParamModel {
  PositionModel? driver;
  PositionModel? destination;

  PolylineParamModel(this.driver, this.destination);
}

class PolylineModelInfo {
  PolylineModel polyline;
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
