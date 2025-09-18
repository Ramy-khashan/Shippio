import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_images.dart';

class HomeDecorationImage extends StatelessWidget {
  const HomeDecorationImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: AppColors.primaryColor,
      child: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              image: AssetImage(AppImages.introP1),
              color: AppColors.opacityPrimaryColor,
            ),
            Image(
              image: AssetImage(AppImages.introP2),
              color: AppColors.opacityPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
