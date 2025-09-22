 import 'package:flutter/material.dart';

class GlassyDropDownPart extends StatelessWidget {
  const GlassyDropDownPart({
    super.key,
    required this.selectedMeasure,
    required this.onChangeMeasure,
    required this.measurements,
  });
  final String? selectedMeasure;
  final Function(dynamic)? onChangeMeasure;
  final List<String> measurements;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 10),
      child: DropdownButton<String>(
        value: selectedMeasure,
        borderRadius: BorderRadius.circular(7),
        underline: const SizedBox(),
        dropdownColor: Colors.white.withValues(alpha: 0.3),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        iconEnabledColor: Colors.white,

        items: measurements
            .map<DropdownMenuItem<String>>(
              (value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value.toString()),
              ),
            )
            .toList(),
        onChanged: onChangeMeasure,
      ),
    );

   
  }
}
