import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shippio/config/router/router_keys.dart';
import 'package:shippio/modules/splash/view/splash_screen.dart';
import 'package:shippio/shippio_app.dart';

import '../../modules/auth/sign_in/controller/sign_in_bloc.dart';
import '../../modules/auth/sign_in/view/sign_in_screen.dart';
import '../../modules/on_boarding/controller/on_boarding_bloc.dart';
import '../../modules/on_boarding/view/on_boarding_screen.dart';

final GoRouter appRouter = GoRouter(
  navigatorKey: ShippioApp.navigatorKey,
  initialLocation: RouterKeys.splashScreen,
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    getRouteInstance(RouterKeys.splashScreen, (state) => const SplashScreen()),
    getRouteInstance(RouterKeys.homeScreen, (state) => const Scaffold()),
    getRouteInstance(
      RouterKeys.signInScreen,
      (state) => BlocProvider(
        create: (context) => SignInBloc(),
        child: SignInScreen(),
      ),
    ),
    getRouteInstance(
      RouterKeys.onBoardingScreen,
      (state) => BlocProvider(
        create: (context) => OnBoardingBloc()..add(HandleAnimationEvent()),
        child: OnBoardingScreen(),
      ),
    ),
  ],
);
GoRoute getRouteInstance(
  String path,
  Widget Function(GoRouterState state) screen,
) => GoRoute(
  path: path,
  name: path,
  builder: (BuildContext context, GoRouterState state) {
    return screen(state);
  },
);
