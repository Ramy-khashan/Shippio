import 'package:flutter/material.dart';
import '../../constant/app_images.dart';

import '../../models/google_map_model.dart';

class MarkerIcons {
  static late BitmapDescriptorModel pickUpIcon;
  static late BitmapDescriptorModel destinationIcon;
  static late BitmapDescriptorModel driver;

  static Future<void> preload(BuildContext context) async {
    final pickup = await BitmapDescriptorModel.updateImage(
      icon: AppImages.pickup,
      size: Size(48, 48),
    );
    pickUpIcon = BitmapDescriptorModel(pickup);

    final destination = await BitmapDescriptorModel.updateImage(
      icon: AppImages.destination,
      size: Size(48, 48),
    );
    destinationIcon = BitmapDescriptorModel(destination);

    final car = await BitmapDescriptorModel.updateImage(
      icon: AppImages.car,
      size: Size(48, 48),
    );
    driver = BitmapDescriptorModel(car);
  }
}
