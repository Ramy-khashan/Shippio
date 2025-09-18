import 'package:flutter/material.dart';
import '../../../../core/components/app_button.dart';
import '../../../../core/components/app_text_field.dart';
import '../../../../core/utils/functions/validate.dart';
import '../controller/package_information_bloc.dart';
import '../../widgets/app_bar.dart';

class PackageInformationScreen extends StatelessWidget {
  const PackageInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PackageInformationBloc controller = PackageInformationBloc.get(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBar(context),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 15),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "What is in the package ?",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        AppTextField(
                          borderRaduis: 9,
                          labelText: "What is in the package ?",
                          isOuterField: true,
                          controller: controller.packageInfoModel.packageInfo,
                          validator: (val) => Validate.notEmpty(val ?? ""),
                        ),
                        AppTextField(
                          borderRaduis: 9,
                          lines: 7,
                          labelText: "Additional Note (Optional)",
                          isOuterField: true,
                          controller:
                              controller.packageInfoModel.additionalNotes,
                        ),
                      ],
                    ),
                  ),
                ),
                AppButton(
                  title: "Next",
                  onPressed: () {
                    controller.add(OnSubmitInfoEvent(context: context));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
