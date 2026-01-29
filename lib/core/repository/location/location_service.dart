 
import '../../models/google_map_model.dart';

abstract class LocationService {
   Future<PositionModel?> getCurrentLocation();
}