import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../shippio_app.dart';

import '../../../config/router/router_keys.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    navigatorTimer();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  Future<void> navigatorTimer() async {
    await Future.delayed(const Duration(seconds: 3), () {
      ShippioApp.navigatorKey.currentContext?.go(
        RouterKeys.onBoardingScreen,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.0,
            colors: AppColors.grediantColors,
          ),
        ),
        child: AnimatedBuilder(
          animation: _controller,
          child: Image.asset(AppImages.logo),
          builder: (context, child) {
            final t = _controller.value * 2 * 3.14159;

            final angle = 0.05 * (sin(t));
            final yOffset = 10 * (sin(t * 1.5));

            return Transform.translate(
              offset: Offset(0, yOffset),
              child: Transform.rotate(angle: angle, child: child),
            );
          },
        ),
      ),
    );
  }
}
