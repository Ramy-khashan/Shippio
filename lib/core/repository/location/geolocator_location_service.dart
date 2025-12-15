import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../models/google_map_model.dart';
import 'location_service.dart';

class GeolocatorLocationService implements LocationService {
  @override
  Future<PositionModel?> getCurrentLocation() async {
    var status = await Permission.location.status;

    if (status.isDenied || status.isRestricted) {
      status = await Permission.location.request();
      if (!status.isGranted) return null;
    }

    if (status.isPermanentlyDenied) {
      await openAppSettings();
      return null;
    }

    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return null;
    }

    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );
    return PositionModel(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }
}
/* 
For IOS
post_install do |installer|
  installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)

    target.build_configurations.each do |config|
 
      config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
        '$(inherited)',
        ## dart: PermissionGroup.camera
        'PERMISSION_CAMERA=1',
        ## dart: PermissionGroup.photos
        'PERMISSION_PHOTOS=1',
        ## The 'PERMISSION_LOCATION' macro enables the `locationWhenInUse` and `locationAlways` permission. If
        ## the application only requires `locationWhenInUse`, only specify the `PERMISSION_LOCATION_WHENINUSE`
        ## macro.
        ##
        ## dart: [PermissionGroup.location, PermissionGroup.locationAlways, PermissionGroup.locationWhenInUse]
        'PERMISSION_LOCATION=1',
        'PERMISSION_LOCATION_WHENINUSE=0',

        ## dart: PermissionGroup.notification
        'PERMISSION_NOTIFICATIONS=1',
 
 
      ]

    end
  end
end
 */