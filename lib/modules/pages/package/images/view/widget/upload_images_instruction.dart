import 'package:flutter/material.dart';

import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/constant/app_images.dart';

class UploadImagesInstruction extends StatelessWidget {
  const UploadImagesInstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
            child: Image(image: AssetImage(AppImages.packageImage)),
          ),
        ),
        Text(
          "If you do not follow this instruction, your order request will not be valid",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.whiteColor,
          ),
        ),
      ],
    );
  }
}
