import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../../../core/constant/app_colors.dart';

import '../../../../../core/components/glassy_icon_btn.dart';

class HeaderInfo extends StatelessWidget {
  const HeaderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: .4), width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: AppColors.whiteColor.withValues(alpha: .10), // شفافية
            padding: const EdgeInsetsDirectional.only(start: 10),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: AppColors.primaryColor,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        Text(
                          "Ramy Khashan",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                        Text("ramy@gmail.com"),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8.0),
                  child: GlassyIconBtn(
                    icon: Icons.edit_note_outlined,
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
