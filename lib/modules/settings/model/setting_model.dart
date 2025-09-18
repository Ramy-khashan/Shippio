import 'package:flutter/widgets.dart';

class SettingModel {
  final String title;
  final IconData icon;
   final String? pagePath;
  SettingModel(
      {required this.title,
      required this.icon,
      this.pagePath});
}
