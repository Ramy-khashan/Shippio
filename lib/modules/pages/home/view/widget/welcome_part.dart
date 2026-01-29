import 'package:flutter/material.dart';

import '../../../../../core/constant/app_colors.dart';

class WelcomePart extends StatelessWidget {
  const WelcomePart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(34, 15, 34, 0),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: "Hi\n", style: TextStyle(fontSize: 18)),
                TextSpan(
                  text: "Rami",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: AppColors.opacityPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Text(
            "What are you sending today ?",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
