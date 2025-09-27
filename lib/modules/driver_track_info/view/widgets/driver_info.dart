import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shippio/core/components/app_button.dart';
import 'package:shippio/core/components/glassy_icon_btn.dart';
import 'package:shippio/core/components/glassy_show_bottom_sheet.dart';
import 'package:shippio/core/constant/app_colors.dart';
import 'package:shippio/core/constant/app_enums.dart';
import 'package:shippio/core/constant/app_images.dart';

import '../../controller/driver_track_info_bloc.dart';
import 'assign_driver_loading.dart';

class DriverInfo extends StatelessWidget {
  const DriverInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DriverTrackInfoBloc, DriverTrackInfoState>(
      builder: (context, state) {
        return GlassyShowBottomSheet(
          padding: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: state.getDriverStatus == RequestStatus.success
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        color: AppColors.blackColor,
                        child: ListTile(

                          leading: Container(
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: .4,
                                color: AppColors.greenColor,
                              ),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(AppImages.driver),
                                fit: BoxFit.cover
                              ),
                            ),
                          ),
                          title: Text(
                            "Ramy Khashan",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "4.5 ⭐",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Text(
                            "🕦 5 Mins Away",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      ListTile(
                        minLeadingWidth: 0,

                        title: Text(
                          "Status",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,

                            color: AppColors.tertiaryColor,
                          ),
                        ),
                        subtitle: Text(
                          "Go to destination",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        trailing: GlassyIconBtn(
                          icon: Icons.phone,
                          onPress: () {},
                          iconColor: AppColors.primaryColor,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppButton(
                            title: "View Progress",
                            textColor: AppColors.primaryColor,
                            horizontalPadding: 20,
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  )
                : AssignDriverLoading(),
          ),
        );
      },
    );
  }
}
