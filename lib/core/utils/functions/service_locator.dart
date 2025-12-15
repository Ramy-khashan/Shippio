 

import 'package:get_it/get_it.dart';

import '../../repository/file_process/file_process.dart';
import '../../repository/location/geolocator_location_service.dart';
import '../../repository/location/location_service.dart';
import '../../repository/maps/google_map_service.dart';
import '../../repository/maps/map_service.dart';

final sl = GetIt.instance;
Future<void> serviceLocator() async {
   sl.registerLazySingleton<MapService>(() => GoogleMapService());
  sl.registerFactory<LocationService>(() => GeolocatorLocationService());
  sl.registerFactory<FileProcess>(() => FileProcessImpl());

}
