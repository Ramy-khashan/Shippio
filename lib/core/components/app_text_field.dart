import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constant/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.labelText,
    this.controller,
    this.validator,
    this.lines,
    this.keyboardType,
    this.suffixWidget,
    this.borderRaduis = 14,
    this.isOuterField = false,
    this.isPassword = false,
    this.prefixWidget,
    this.inputFormatters = const [],
  });
  final String? labelText;
  final bool isPassword;
  final bool isOuterField;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final double borderRaduis;
  final int? lines;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final List<TextInputFormatter> inputFormatters;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isOuterField)
            if (labelText != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  labelText.toString(),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
          TextFormField(
            obscureText: isPassword,
            keyboardType: keyboardType,
            maxLines: lines,
            controller: controller,
            validator: validator,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              suffixIcon: suffixWidget,
              prefixIcon: prefixWidget,
              filled: true,
              fillColor: AppColors.whiteColor.withValues(alpha: .1),
              labelText: isOuterField ? null : labelText,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(borderRaduis),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.whiteColor),
                borderRadius: BorderRadius.circular(borderRaduis),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.whiteColor),
                borderRadius: BorderRadius.circular(borderRaduis),
              ),
              labelStyle: TextStyle(color: AppColors.whiteColor),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
