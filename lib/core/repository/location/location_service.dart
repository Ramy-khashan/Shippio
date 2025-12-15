 
import '../../models/google_map_model.dart';

abstract class LocationService {
  /// Requests permission and returns current device location.
  Future<PositionModel?> getCurrentLocation();
}