import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../config/router/router_keys.dart';
import '../../../../core/components/glassy_icon_btn.dart';
import '../../../../core/constant/app_colors.dart';

class PackageHistoryShape extends StatelessWidget {
  const PackageHistoryShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),

              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withValues(alpha: 0.12),
                  Colors.white.withValues(alpha: 0.01),
                  Colors.white.withValues(alpha: 0.12),
                ],
              ),
              border: Border.all(
                width: .7,
                color: Colors.white.withValues(alpha: 0.8),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withValues(alpha: .04),
                  blurRadius: 12,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: "Package ID "),
                            TextSpan(
                              text: "#1223e31",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "Delivery Food",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: "Transport By : "),
                              TextSpan(
                                text: "Car",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      Text(
                        DateFormat(
                          "yyyy/MM/dd - hh:mm a",
                        ).format(DateTime.now()),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                PositionedDirectional(
                  top: 0,
                  end: 0,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(5),
                    ),
                    color: AppColors.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4,
                      ),
                      child: Text("Delivered"),
                    ),
                  ),
                ),
                PositionedDirectional(
                  bottom: 8,
                  end: 10,
                  child: GlassyIconBtn(
                    icon: Icons.arrow_forward,
                    onPress: () {
                      context.pushNamed(RouterKeys.packageHistoryDetailsScreen);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
