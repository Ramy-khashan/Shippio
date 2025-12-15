import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shippio/core/components/app_button.dart';
import 'package:shippio/modules/trip_process_parts/widgets/payment_shape.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../trip_process/controller/trip_process_bloc.dart';

class ConfirmTripBottomSheetPart extends StatelessWidget {
  const ConfirmTripBottomSheetPart({super.key});

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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Setup Payment Option",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: RadioGroup(
                    groupValue: state.selectedPayment,
                    onChanged: (paymentType) {
                      controller.add(
                        OnSelectPaymentEvent(paymentType: paymentType!),
                      );
                    },
                    child: ListView.builder(
                      itemCount: controller.paymentsList.length,
                      itemBuilder: (context, index) => PaymentShape(
                        payment: controller.paymentsList[index],
                        onTap: () {
                          controller.add(
                            OnSelectPaymentEvent(
                              paymentType:
                                  controller.paymentsList[index].paymentType,
                            ),
                          );
                        },
                        paymentType: state.selectedPayment,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: AppButton(
                          title: "Back",
                          textColor: AppColors.redColor,
                           onPressed: () {
                            controller.add(
                              OnNavigationBackEvent(context: context),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: AppButton(
                          title: "Confirm Trip",
                           onPressed: () {
                            if (context.mounted) {
                              context.pop(true);
                        
                              controller.add(ShowSummaryEven(context: context));
                            }
                          },
                        ),
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
