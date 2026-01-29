import 'package:flutter/widgets.dart';

class PackageInfoModel {
  final TextEditingController packageInfo;
  final TextEditingController additionalNotes;

  PackageInfoModel({required this.packageInfo, required this.additionalNotes});
  Map<String, String?> toJson() {
    return {
      "package_info": packageInfo.text,
      "package_additional_notes": additionalNotes.text.isEmpty
          ? null
          : additionalNotes.text,
    };
  }
}
