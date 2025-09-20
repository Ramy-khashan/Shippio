 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shippio/core/components/app_text_field.dart';
import 'package:shippio/core/constant/app_colors.dart';
import '../../../../core/components/app_button.dart';
import '../../../trip_process/controller/trip_process_bloc.dart';

class PickUpBottomSheetPart extends StatelessWidget {
  const PickUpBottomSheetPart({super.key});

  @override
  Widget build(BuildContext context) {
    TripProcessBloc controller = TripProcessBloc.get(context);
    return  BlocBuilder<TripProcessBloc, TripProcessState>(
   
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
                      "Pick Up Address",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
                AppTextField(
                  controller: controller.pickUpAddressInfo.country,
                  labelText: "Country",
                ),
                AppTextField(
                  controller: controller.pickUpAddressInfo.city,
                  labelText: "City",
                ),
                AppTextField(
                  controller: controller.pickUpAddressInfo.streetAddress,
                  labelText: "Street",
                ),

                AppTextField(
                  controller: controller.pickUpAddressInfo.phoneNumber,
                  labelText: "Phone Number",
                ),
                AppTextField(
                  controller: controller.pickUpAddressInfo.postaCode,
                  labelText: "Post Code",
                ),
                AppTextField(
                  controller: controller.pickUpAddressInfo.address,
                  labelText: "Adress",
                  lines: 3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppButton(
                        title: "Back",
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
