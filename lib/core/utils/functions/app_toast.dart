import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../constant/app_colors.dart';

class AppToast {
  AppToast(
    String msg, {
    double? fontSize,
    bool isError = false,
    Color? fontColor,
    Color? background,
    String? webBgColor,
  }) {
    Fluttertoast.showToast(
      webBgColor: webBgColor,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 7,
      toastLength: Toast.LENGTH_LONG,
      msg: msg,
      fontSize: fontSize ?? 15,
      textColor: Colors.white,
      backgroundColor: isError ? AppColors.redColor : AppColors.primaryColor,
    );
  }
}
