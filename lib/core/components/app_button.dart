import 'package:flutter/material.dart';
import 'package:shippio/core/constant/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.width=50,
    this.height=45,
    this.bgColor=AppColors.primaryColor,
    this.textColor=AppColors.whiteColor,
    this.fontSize=16,
  });
  final String title;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color? bgColor;
  final Color? textColor;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? 0, height ?? 0),
        backgroundColor: bgColor,
        foregroundColor: textColor,
        textStyle: TextStyle(fontSize: fontSize), 
      ),
      child: Text(title,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
          ),
    );
  }
}
