import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import 'package:go_router/go_router.dart';

appBar(BuildContext context) => PreferredSize(
  preferredSize: Size(
    double.infinity,
    Theme.of(context).appBarTheme.toolbarHeight ?? 50,
  ),
  child: AppBar(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    elevation: 0,
    scrolledUnderElevation: 0,
    leadingWidth: 0,
    leading: SizedBox(),

    actionsPadding: EdgeInsets.zero,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton.icon(
          onPressed: () {
            if (context.canPop()) context.pop();
          },
          label: Text(
            "Back",
            style: TextStyle(
              color: AppColors.whiteColor,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.whiteColor,
            ),
          ),
          icon: Image.asset(
            AppImages.arrowBack,
            color: AppColors.opacityPrimaryColor,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Cancel Order",
            style: TextStyle(
              color: AppColors.whiteColor,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.whiteColor,
            ),
          ),
        ),
      ],
    ),
  ),
);
