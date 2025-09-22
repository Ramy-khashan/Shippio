import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shippio/core/components/app_button.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_enums.dart';
import '../../../trip_process/controller/trip_process_bloc.dart';

class SchedulePickTimeBottomSheetPart extends StatelessWidget {
  const SchedulePickTimeBottomSheetPart({super.key});

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
                    "Schedule a pickup time:",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 400,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.dateAndTime,
                    initialDateTime: DateTime(
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day,
                    ),
                    onDateTimeChanged: (DateTime newDateTime) {
                      // Do something
                    },
                  ),
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
                              tripProcess: TripProcessEnum.tripVehicleType,
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
