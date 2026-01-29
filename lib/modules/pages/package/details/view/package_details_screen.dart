import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/components/app_button.dart';
import '../../../../../core/components/app_text_field.dart';
import '../controller/package_details_bloc.dart';
import 'widgets/package_textfield_measure_item.dart';
import '../../../../../core/utils/functions/validate.dart';
import '../../widgets/app_bar.dart';

class PackageDetailsScreen extends StatelessWidget {
  const PackageDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PackageDetailsBloc controller = PackageDetailsBloc.get(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBar(context),
        body: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: BlocBuilder<PackageDetailsBloc, PackageDetailsState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Provide more details about your parcel.",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          PackageTextfieldMeasureItem(
                            controller: controller.packageDetails.packageHeight,
                            title: "Height of Package",
                            selectedMeasure: state.heightMeasureType,
                            onChangeMeasure: (val) {
                              controller.add(
                                ChangeHeightMeasureEvent(
                                  heightMeasureType: val,
                                ),
                              );
                            },
                          ),
                          PackageTextfieldMeasureItem(
                            controller: controller.packageDetails.packageWidth,
                            title: "Width of Package",
                            selectedMeasure: state.widthtMeasureType,
                            onChangeMeasure: (val) {
                              controller.add(
                                ChangeWidthMeasureEvent(widthtMeasureType: val),
                              );
                            },
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: PackageTextfieldMeasureItem(
                                  controller:
                                      controller.packageDetails.packageWeight,
                                  title: "Weight of Package",
                                  selectedMeasure: state.weightMeasureType,
                                  onChangeMeasure: (val) {
                                    controller.add(
                                      ChangeWeightMeasureEvent(
                                        weightMeasureType: val,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: AppTextField(
                                  inputFormatters: [
                                    Validate.numberOnlyFormater,
                                  ],
                                  keyboardType: TextInputType.number,

                                  isOuterField: true,
                                  borderRaduis: 9,
                                  labelText: "Quantity",
                                  controller:
                                      controller.packageDetails.quantity,
                                  validator: (val) =>
                                      Validate.notEmpty(val ?? ""),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Please note: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "The driver will have a scale at hand to verify the weight of your package. If there is a difference in the weight of the package, it may affect the delivery cost.",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: AppButton(
                  title: "Next",
                  onPressed: () {
                    controller.add(OnSubmitEvent(context: context));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
