import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../modules/driver_track_info/controller/driver_track_info_bloc.dart';
import '../../modules/driver_track_info/view/driver_track_info_screen.dart';
import '../../modules/navigation/controller/navigation_bar_bloc.dart';
import '../../modules/navigation/view/navigation_bar_screen.dart';
import '../../modules/package/images/view/package_images_screen.dart';
import '../../modules/package_history_details/controller/package_history_details_bloc.dart';
import '../../modules/package_history_details/view/package_history_details.dart';
import '../../modules/trip_process/controller/trip_process_bloc.dart';
import '../../modules/trip_process/view/trip_process_screen.dart';
import '../../modules/view_file/view/view_file.dart';
import 'router_keys.dart';
import '../../modules/home/controller/home_bloc.dart';
import '../../modules/package/details/controller/package_details_bloc.dart';
import '../../modules/package/details/view/package_details_screen.dart';
import '../../modules/package/images/controller/package_images_bloc.dart';
import '../../modules/package/information/controller/package_information_bloc.dart';
import '../../modules/package/information/view/package_information_screen.dart';
import '../../modules/splash/view/splash_screen.dart';
import '../../shippio_app.dart';
import '../../modules/auth/sign_in/controller/sign_in_bloc.dart';
import '../../modules/auth/sign_in/view/sign_in_screen.dart';
import '../../modules/home/view/home_screen.dart';
import '../../modules/on_boarding/controller/on_boarding_bloc.dart';
import '../../modules/on_boarding/view/on_boarding_screen.dart';

final GoRouter appRouter = GoRouter(
  navigatorKey: ShippioApp.navigatorKey,
  initialLocation: RouterKeys.splashScreen,
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    getRouteInstance(RouterKeys.splashScreen, (state) => const SplashScreen()),
    getRouteInstance(
      RouterKeys.onBoardingScreen,
      (state) => BlocProvider(
        create: (context) => OnBoardingBloc()..add(HandleAnimationEvent()),
        child: OnBoardingScreen(),
      ),
    ),
    getRouteInstance(
      RouterKeys.signInScreen,
      (state) => BlocProvider(
        create: (context) => SignInBloc(),
        child: SignInScreen(),
      ),
    ),
    getRouteInstance(
      RouterKeys.navigationBar,
      (state) => BlocProvider(
        create: (context) => NavigationBarBloc(),
        child: const NavigationBarScreen(),
      ),
    ),
    getRouteInstance(
      RouterKeys.homeScreen,
      (state) => BlocProvider(
        create: (context) => HomeBloc(),
        child: const HomeScreen(),
      ),
    ),
    getRouteInstance(
      RouterKeys.packageHistoryDetailsScreen,
      (state) => BlocProvider(
        create: (context) => PackageHistoryDetailsBloc(),
        child: const PackageHistoryDetailsScreen(),
      ),
    ),
    getRouteInstance(
      RouterKeys.packageDetailsScreen,
      (state) => BlocProvider(
        create: (context) => PackageDetailsBloc(),
        child: const PackageDetailsScreen(),
      ),
    ),
    getRouteInstance(
      RouterKeys.packageInformationScreen,
      (state) => BlocProvider(
        create: (context) => PackageInformationBloc(),
        child: const PackageInformationScreen(),
      ),
    ),
    getRouteInstance(
      RouterKeys.packageImagesScreen,
      (state) => BlocProvider(
        create: (context) => PackageImagesBloc(),
        child: const PackageImagesScreen(),
      ),
    ),
    getRouteInstance(
      RouterKeys.tripProcessScreen,
      (state) => BlocProvider(
        create: (context) => TripProcessBloc(),
        child: const TripProcessScreen(),
      ),
    ),
    getRouteInstance(RouterKeys.driverTrackInfoScreen, (state) {
      Set<Marker> markers = (state.extra as Map<String, dynamic>)['markers'];
      return BlocProvider(
        create: (context) =>
            DriverTrackInfoBloc()..add(GetMarkerAndPosition(markers: markers)),
        child: DriverTrackInfoScreen(),
      );
    }),
    getRouteInstance(RouterKeys.viewFile, (state) {
      String file = (state.extra as Map<String, dynamic>)['file'];
      String? fileName = (state.extra as Map<String, dynamic>)['name'];
      return ViewFile(file: file, fileName: fileName);
    }),
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
