import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shippio/core/components/app_button.dart';
import 'package:shippio/core/components/app_text_field.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_enums.dart';
import '../../../trip_process/controller/trip_process_bloc.dart';

class DistnationBottomSheetPart extends StatelessWidget {
  const DistnationBottomSheetPart({super.key});

  @override
  Widget build(BuildContext context) {
    TripProcessBloc controller = TripProcessBloc.get(context);
    return BlocBuilder<TripProcessBloc, TripProcessState>(
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Distnation Address",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
                AppTextField(
                  controller: controller.distnationAddressInfo.country,
                  labelText: "Country",
                ),
                AppTextField(
                  controller: controller.distnationAddressInfo.city,
                  labelText: "City",
                ),
                AppTextField(
                  controller: controller.distnationAddressInfo.streetAddress,
                  labelText: "Street",
                ),

                AppTextField(
                  controller: controller.distnationAddressInfo.phoneNumber,
                  labelText: "Phone Number",
                ),
                AppTextField(
                  controller: controller.distnationAddressInfo.postaCode,
                  labelText: "Post Code",
                ),
                AppTextField(
                  controller: controller.distnationAddressInfo.address,
                  labelText: "Address",
                  lines: 3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppButton(
                        title: "Back",
                        textColor: AppColors.redColor,
                        width: 150,
                        onPressed: () {
                          controller.add(
                            OnNavigationBackEvent(context: context),
                          );
                        },
                      ),
                      SizedBox(width: 10),

                      AppButton(
                        title: "Next",
                        width: 150,

                        onPressed: () {
                          controller.add(
                            OnSubmitEvent(
                              context: context,
                              tripProcess: TripProcessEnum.schedulePickupTime,
                            ),
                          );
                          if (context.mounted) context.pop(true);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
