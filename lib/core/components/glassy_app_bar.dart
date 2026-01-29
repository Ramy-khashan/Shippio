import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'glassy_icon_btn.dart';
import '../constant/app_colors.dart';

class GlassyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  final VoidCallback? onPress;
  final IconData? icon;
  final Color iconColor;

  const GlassyAppBar({
    super.key,
    required this.title,
    this.height = kToolbarHeight,
    this.onPress,
    this.icon,
    this.iconColor = AppColors.whiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY:1), // blur strength
        child: AppBar(
          backgroundColor: Colors.white.withValues(alpha: 0.14),
          leading: GlassyIconBtn(
            iconColor: iconColor,
            icon:
                icon ??
                (Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back),
            onPress:
                onPress ??
                () {
                  context.pop();
                },
          ),
          leadingWidth: 70,
          elevation: 0,
          centerTitle: true,
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
