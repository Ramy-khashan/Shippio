import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shippio/core/constant/app_images.dart';

class MarkerIcons {
  static late BitmapDescriptor pickUpIcon;
  static late BitmapDescriptor destinationIcon;
  static late BitmapDescriptor driver;

  static Future<void> preload(BuildContext context) async {
    pickUpIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(48, 48)),
      AppImages.pickup,
    );

    destinationIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(48, 48)),
      AppImages.destination,
    );
    driver = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(48, 48)),
      AppImages.car,
    );
  }
}
