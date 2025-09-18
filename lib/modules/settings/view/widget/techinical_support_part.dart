import 'package:flutter/material.dart';
import '../../../../core/constant/app_images.dart';
import '../../../../shippio_app.dart';

import '../../../../core/components/image_item.dart';
import '../../../../core/constant/app_colors.dart';

showTechnicalSupportModel() => showModalBottomSheet(
  backgroundColor: AppColors.tertiaryColor,
  showDragHandle: true,
  context: ShippioApp.navigatorKey.currentContext!,
  builder: (BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Contact with us",
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {},
                  child: const ImageItem(AppImages.whatsapp),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {},
                  child: const ImageItem(AppImages.phone),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  },
);
