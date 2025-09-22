import 'package:flutter/material.dart';
import '../../core/constant/app_colors.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.secondaryColor,
  brightness: Brightness.dark,
  useMaterial3: true,
  dialogTheme: DialogThemeData(
    backgroundColor: Colors.black.withValues(alpha: 0.3),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.black.withValues(alpha: 0.3),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.only(
        topLeft: Radius.circular(35),
        topRight: Radius.circular(35),
      ),
    ),
  ),
);
