import 'package:flutter/material.dart';
import 'config/theme/dark_theme.dart';
import 'config/theme/light_theme.dart';
import 'config/router/router_config.dart';
import 'core/constant/app_strings.dart';

class ShippioApp extends StatelessWidget {
  const ShippioApp({super.key});
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appTitle,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      routerConfig: appRouter,
    );
  }
}
