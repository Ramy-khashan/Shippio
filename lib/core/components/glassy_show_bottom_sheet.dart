import 'dart:ui';

import 'package:flutter/material.dart';

class GlassyShowBottomSheet extends StatelessWidget {
  const GlassyShowBottomSheet({super.key, required this.child,   this.padding=20});
  final Widget child;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: BorderRadius.only(topLeft:Radius.circular(35),topRight:Radius.circular(35)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 8),
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          padding:   EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.2),
            borderRadius: BorderRadius.only(topLeft:Radius.circular(35),topRight:Radius.circular(35)),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.3),
              width: 1.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
