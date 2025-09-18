import 'package:flutter/material.dart';
import '../../../../shippio_app.dart';

import '../../../../core/components/app_button.dart';
import '../../../../core/constant/app_colors.dart';

showDeleteAccountModel() => showModalBottomSheet(
  context: ShippioApp.navigatorKey.currentContext!,
  backgroundColor: AppColors.tertiaryColor,
  showDragHandle: true,
  builder: (BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(  35,0,35,35),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Delete Account",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
             ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Your data will be deleted securely and in accordance with our privacy policy.",
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                AppButton(
                onPressed: () {},
 
                title: "Cancel",
                height: 35,
                horizontalPadding: 25,
              ),
              AppButton(
                onPressed: () {},
                title: "Delete",
               textColor: AppColors.redColor,
               height: 35,
               
                horizontalPadding: 25,
              ),
               
            
            ],
          ),
        ],
      ),
    );
  },
);
