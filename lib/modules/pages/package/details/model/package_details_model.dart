import 'package:flutter/widgets.dart';

class PackageDetailsModel {
  TextEditingController packageHeight;
  String? heightMeasuerment;
  TextEditingController packageWidth;
  String? widhtMeasuerment;
  TextEditingController packageWeight;
  String? weightMeasuerment;
  TextEditingController quantity;
  PackageDetailsModel({
    required this.packageHeight,
    this.heightMeasuerment,
    required this.packageWidth,
    this.widhtMeasuerment,
    required this.packageWeight,
    this.weightMeasuerment,
    required this.quantity,
  });
  Map<String, Object?> toJson() {
    return {
      'package_height': double.parse(packageHeight.text),
      'height_measuerment': heightMeasuerment,
      'widht_measuerment': widhtMeasuerment,
      'weight_measuerment': weightMeasuerment,
      'package_widht': double.parse(packageWidth.text),
      'package_weight': double.parse(packageWeight.text),
      'quantity': double.parse(quantity.text),
    };
  }
}
