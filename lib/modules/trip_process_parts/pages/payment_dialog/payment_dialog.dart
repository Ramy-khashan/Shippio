import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shippio/core/components/app_button.dart';
import 'package:shippio/core/constant/app_colors.dart';

import '../../../../core/constant/app_enums.dart';
import '../../../trip_process/controller/trip_process_bloc.dart';

class PaymentDialog extends StatelessWidget {
  const PaymentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    TripProcessBloc controller = TripProcessBloc.get(context);
    return BlocBuilder<TripProcessBloc, TripProcessState>(
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(8, 20, 8, 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Summay",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppColors.whiteColor,
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    padding: EdgeInsets.only(top: 10),
                    shrinkWrap: true,
                    itemCount: controller.summarList.length,
                    separatorBuilder: (context, index) =>
                        index == controller.summarList.length - 2
                        ? Divider(color: AppColors.whiteColor, thickness: .6)
                        : SizedBox.shrink(),
                    itemBuilder: (context, index) => ListTile(
                      title: Text(
                        controller.summarList[index]['title'],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      trailing: Text(
                        "${controller.summarList[index]['value']} L.E",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          title: "Cancel",
                          onPressed: () {
                            controller.add(
                              OnNavigationBackEvent(context: context),
                            );
                          },
                          textColor: AppColors.redColor,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: AppButton(
                          title: "Confirm",
                          onPressed: () {
                            if (context.mounted) {
                              controller.add(
                                OnSubmitEvent(
                                  context: context,
                                  tripProcess: TripProcessEnum.selectPayment,
                                ),
                              );
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
