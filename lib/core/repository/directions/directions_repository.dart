import 'package:dio/dio.dart';
 
import '../../models/directions_model.dart';
import '../../models/google_map_model.dart';

class DirectionsRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

  final Dio _dio;

  DirectionsRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<Directions?> getDirections({
    required PositionModel origin,
    required PositionModel destination,
  }) async {
    final response = await _dio.get(
      _baseUrl,
      queryParameters: {
 
        'origin': '${origin.position.latitude},${origin.position.longitude}',
        'destination': '${destination.position.latitude},${destination.position.longitude}',
        //TODO:Add APi Key
        'key': "AIzaSyBfVMBgd4bzqn4ARkRPUaWSYc1fBaa1CbU",
       },
    );
 
    if (response.statusCode == 200 &&
        List.from(response.data['routes']).isNotEmpty) {
      return Directions.fromMap(response.data);
    }
    return null;
  }
}
