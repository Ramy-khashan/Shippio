import 'package:flutter/material.dart';
import 'package:shippio/core/constant/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.labelText,
    this.controller,
    this.validator,
  });
  final String? labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:15),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(40),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        ),
      ),
    );
  }
}
