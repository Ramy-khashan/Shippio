import 'package:flutter/material.dart';
import '../../trip_process/model/vehicles_model.dart';

import '../../../core/components/image_item.dart';
import '../../../core/constant/app_colors.dart';

class VehicleShape extends StatelessWidget {
  const VehicleShape({
    super.key,
    required this.onTap,
    required this.vehicle,
    this.selectedVehicleId,
  });
  final VoidCallback onTap;
  final int? selectedVehicleId;
  final VehiclesModel vehicle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: vehicle.id == selectedVehicleId
                ? AppColors.whiteColor
                : Colors.transparent,
          ),
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
        margin: EdgeInsets.all(10),
        color: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        child: Row(
          children: [
            Radio(value: vehicle.id, activeColor: AppColors.whiteColor),
            ImageItem(vehicle.image.toString(), width: 130, height: 100),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vehicle.title.toString(),
                      style: TextStyle(fontSize: 17),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "£${vehicle.fees}",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: AppColors.primaryColor,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Text(
                      "${vehicle.timeToDelivery} to deliver",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
