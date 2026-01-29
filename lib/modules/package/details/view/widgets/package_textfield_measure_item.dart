import 'package:flutter/material.dart';
import '../../../../../core/constant/app_colors.dart';

import '../../../../../core/components/app_text_field.dart';
import '../../../../../core/utils/functions/validate.dart';
import '../../controller/package_details_bloc.dart';

class PackageTextfieldMeasureItem extends StatelessWidget {
  const PackageTextfieldMeasureItem({
    super.key,
    required this.controller,
    required this.title,
    this.selectedMeasure,
    this.onChangeMeasure,
  });
  final TextEditingController controller;
  final String title;
  final String? selectedMeasure;
  final Function(dynamic)? onChangeMeasure;
  @override
  Widget build(BuildContext context) {
    return AppTextField(
      keyboardType: TextInputType.number,
      isOuterField: true,
      inputFormatters: [Validate.numberOnlyFormater],
      borderRaduis: 9,
      labelText: title,
      controller: controller,
      validator: (val) => Validate.notEmpty(val ?? ""),
      prefixWidget: Padding(
        padding: const EdgeInsetsDirectional.only(start: 10),
        child: DropdownButton<String>(
          dropdownColor: AppColors.tertiaryColor,
          underline: SizedBox(),
          borderRadius: BorderRadius.circular(7),

          value: selectedMeasure,
          items: PackageDetailsBloc.get(context).measurement
              .map<DropdownMenuItem<String>>(
                (value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value.toString()),
                ),
              )
              .toList(),
          onChanged: onChangeMeasure,
        ),
      ),
    );
  }
}
