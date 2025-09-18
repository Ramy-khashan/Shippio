import 'dart:ui';
import 'package:flutter/material.dart';
import '../constant/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.width,
    this.horizontalPadding=0,
    this.height = 52,
    this.bgColor = Colors.white,
    this.textColor = AppColors.whiteColor,
    this.fontSize = 16,
    this.icon,
  });

  final Widget? icon;
  final String title;
  final VoidCallback onPressed;
  final double  horizontalPadding;
  final double? width;
  final double? height;
  final Color? bgColor;
  final Color? textColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(14),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 100, sigmaY: 80),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: bgColor!.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.35),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[icon!, const SizedBox(width: 6)],
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
