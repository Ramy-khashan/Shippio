import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/glassy_icon_btn.dart';
import '../../../../core/constant/app_colors.dart';

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
              GlassyIconBtn(
                icon: Icons.location_on,
                iconColor: AppColors.redColor,

                onPress: onPickUpPosition,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: GlassyIconBtn(
                  icon: Icons.golf_course,
                  iconColor: AppColors.tertiaryColor,

                  onPress: onDestinationPosition,
                ),
              ),
              GlassyIconBtn(
                icon: CupertinoIcons.car_detailed,

                iconColor: AppColors.blackColor,
                onPress: onDriverPosition,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
