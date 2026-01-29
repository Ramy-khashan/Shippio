import 'package:flutter/material.dart';
import 'core/utils/functions/responsive_handler.dart';
import 'core/utils/functions/service_locator.dart';
import 'shippio_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocator();
  await initScreenUtilsFun();
  runApp(const ShippioApp());
}
