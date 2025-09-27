import 'dart:ui';
import 'package:flutter/material.dart';

class GlassyIconBtn extends StatelessWidget {
  const GlassyIconBtn({
    super.key,
      this.icon,
    required this.onPress,
    this.iconColor,
    this.image,
    this.imageSize,
  });
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback onPress;
  final String? image;
  final Size? imageSize;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,

          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withValues(alpha: 0.17),
                Colors.white.withValues(alpha: 0.01),
                Colors.white.withValues(alpha: 0.17),
              ],
            ),
            border: Border.all(
              width: .7,
              color: Colors.white.withValues(alpha: 0.8),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withValues(alpha: .04),
                blurRadius: 12,
                spreadRadius: 1,
              ),
            ],
          ),
          child: IconButton(
            onPressed: onPress,
            icon: image == null
                ? Icon(icon, color: iconColor ?? Colors.white)
                : Image.asset(
                    image.toString(),
                    width: imageSize?.height ?? 30,
                    height: imageSize?.height ?? 30,
                  ),
          ),
        ),
      ),
    );
  }
}
