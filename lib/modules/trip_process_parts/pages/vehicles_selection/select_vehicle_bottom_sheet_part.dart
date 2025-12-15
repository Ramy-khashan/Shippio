import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shippio/core/components/app_button.dart';
import 'package:shippio/modules/trip_process_parts/widgets/vehicle_shape.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_enums.dart';
import '../../../trip_process/controller/trip_process_bloc.dart';

class SelectVehicleBottomSheetPart extends StatelessWidget {
  const SelectVehicleBottomSheetPart({super.key});

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
                    "Select a Vehicle Type",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                RadioGroup<int?>(
                  groupValue: state.selectedVehicleId,
                  onChanged: (vehicleId) {
                    controller.add(
                      OnSelectVehicleEvent(vehicleId: vehicleId ?? -1),
                    );
                  },
                  child: SizedBox(
                    height: 500,
                    child: ListView.builder(
                      itemCount: controller.vehiclesList.length,
                      itemBuilder: (context, index) => VehicleShape(
                        onTap: () {
                          controller.add(
                            OnSelectVehicleEvent(
                              vehicleId:
                                  controller.vehiclesList[index].id ?? -1,
                            ),
                          );
                        },
                        selectedVehicleId: state.selectedVehicleId,
                        vehicle: controller.vehiclesList[index],
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
                          title: "Next",
                           onPressed: () {
                            controller.add(
                              OnSubmitEvent(
                                context: context,
                                tripProcess: TripProcessEnum.confirmationTrip,
                              ),
                            );
                            if (context.mounted) context.pop(true);
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
