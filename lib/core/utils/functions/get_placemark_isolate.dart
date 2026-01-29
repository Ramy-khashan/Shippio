import 'package:geocoding/geocoding.dart';

import '../../../modules/pages/trip_process/model/location_address_model.dart';

LocationAddressModel parsePlacemark(Placemark placemark) {
  return LocationAddressModel.fromJson(placemark);
}
