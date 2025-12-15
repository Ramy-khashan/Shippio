import 'dart:ui';
import 'package:flutter/material.dart';
import '../constant/app_colors.dart';

class GlassyShowBottomSheet extends StatelessWidget {
  final Widget child;
  final double padding;
  final double colorOpacity;

  const GlassyShowBottomSheet({
    super.key,
    required this.child,
    this.padding = 20,
    this.colorOpacity = .35,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(35),
        topRight: Radius.circular(35),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: AppColors.whiteColor.withValues(
              alpha: colorOpacity,
            ), // ← safer
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
