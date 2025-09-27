import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';

class AssignDriverLoading extends StatelessWidget {
  const AssignDriverLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 30),
          width: 80,
          height: 7,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,

            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            "Processing to assign driver",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        LinearProgressIndicator(
          minHeight: 15,
          borderRadius: BorderRadius.circular(12),
          color: AppColors.opacityPrimaryColor,
          backgroundColor: AppColors.tertiaryColor,
        ),
      ],
    );
  }
}
