import 'package:flutter/material.dart';
import '../../../../core/components/app_text_field.dart';
import '../../../../core/constant/app_colors.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.opacityPrimaryColor,
            ),
          ),
          AppTextField(
            
          )
        ],
      ),
    );
  }
}
