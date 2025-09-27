import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shippio/core/constant/app_images.dart';

import '../../../../core/components/glassy_icon_btn.dart';
 
class MarkerPosition extends StatelessWidget {
  const MarkerPosition({
    super.key,
    required this.onDriverPosition,
    required this.onDestinationPosition,
    required this.onPickUpPosition,
  });
  final VoidCallback onDriverPosition;
  final VoidCallback onDestinationPosition;
  final VoidCallback onPickUpPosition;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            children: [
              GlassyIconBtn(image: AppImages.pickup, onPress: onPickUpPosition),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: GlassyIconBtn(
                  image: AppImages.destination,

                  onPress: onDestinationPosition,
                ),
              ),
              GlassyIconBtn(image: AppImages.car, onPress: onDriverPosition),
            ],
          ),
        ),
      ),
    );
  }
}
