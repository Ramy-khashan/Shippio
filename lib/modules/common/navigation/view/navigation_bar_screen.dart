import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constant/app_colors.dart';
import '../controller/navigation_bar_bloc.dart';

class NavigationBarScreen extends StatelessWidget {
  const NavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NavigationBarBloc.get(context);
    return BlocBuilder<NavigationBarBloc, NavigationBarState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.secondaryColor,
          extendBodyBehindAppBar: true,
          body: controller.pagesList[state.selectedPage].page,

          bottomNavigationBar: Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              border: Border.all(
                color: Colors.white.withValues(alpha: .5),
                width: 1,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: 70,
                  color: Colors.white.withValues(alpha: .10), // شفافية
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(controller.pagesList.length, (
                      index,
                    ) {
                      final isSelected = state.selectedPage == index;
                      return GestureDetector(
                        onTap: () {
                          controller.add(
                            ChangePageEvent(selectedPageIndex: index),
                          );
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.white.withAlpha(65)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            controller.pagesList[index].icon,
                            size: 28,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
