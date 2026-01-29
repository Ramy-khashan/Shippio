import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/components/app_button.dart';
import '../../../../../core/constant/app_colors.dart';

class DeleteAccountPart extends StatelessWidget {
  const DeleteAccountPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Delete Account",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
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
              onPressed: () {
                context.pop();
              },

              title: "Cancel",
              height: 50,
              horizontalPadding: 30,
            ),
            AppButton(
              onPressed: () {},
              title: "Delete",
              textColor: AppColors.redColor,
              height: 50,

              horizontalPadding: 30,
            ),
          ],
        ),
      ],
    );
  }
}
