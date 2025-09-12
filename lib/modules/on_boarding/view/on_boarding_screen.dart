import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shippio/core/constant/app_colors.dart';
import '../../../config/router/router_keys.dart';
import '../../../core/constant/app_images.dart';
import '../controller/on_boarding_bloc.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.0,
            colors: AppColors.grediantColors,
          ),
          image: DecorationImage(
            image: AssetImage(AppImages.onboardingBg),
            fit: BoxFit.cover,
          ),
        ),
        child: BlocBuilder<OnBoardingBloc, OnBoardingState>(
          builder: (context, state) {
            return Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(state.containerExpanded ? 50 : 0),
                    topRight: Radius.circular(state.containerExpanded ? 50 : 0),
                  ),
                ),
                width: 80,
                height: state.containerExpanded ? 130 : 0,
                duration: const Duration(milliseconds: 1500),
                curve: Curves.bounceInOut,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: AnimatedOpacity(
                    opacity: state.buttonVisible ? 1 : 0,
                    duration: const Duration(milliseconds: 800),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeOutBack,
                      width: state.buttonVisible ? 70 : 0,
                      height: state.buttonVisible ? 70 : 0,
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withValues(alpha: .6),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: FloatingActionButton(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        heroTag: "onBoardingBtn",
                        onPressed: () {
                          context.push(RouterKeys.signInScreen);
                        },
                        child: Icon(
                          Icons.arrow_forward,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
