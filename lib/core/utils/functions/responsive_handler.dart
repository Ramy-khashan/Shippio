import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// # Responsive Handler - Usage Guide
///
/// This file provides utilities for building responsive layouts across
/// mobile, tablet, and desktop devices with orientation support.
///
/// ## Quick Start Examples:
///
/// ### 1. ScreenUtil Extensions (existing)
/// ```dart
/// Container(
///   width: 200.width,      // Responsive width
///   height: 100.height,    // Responsive height
///   child: Text(
///     'Hello',
///     style: TextStyle(fontSize: 16.fontSize),  // Responsive font
///   ),
/// )
/// ```
///
/// ### 2. Device Type Checks
/// ```dart
/// if (context.isMobile) {
///   // Mobile layout
/// } else if (context.isTablet) {
///   // Tablet layout
/// }
/// ```
///
/// ### 3. ResponsiveLayout Widget
/// ```dart
/// ResponsiveLayout(
///   mobile: MobileView(),
///   tablet: TabletView(),    // Optional
///   desktop: DesktopView(),  // Optional
/// )
/// ```
///
/// ### 4. OrientationLayout Widget
/// ```dart
/// OrientationLayout(
///   portrait: Column(children: [...]),
///   landscape: Row(children: [...]),
/// )
/// ```
///
/// ### 5. Dynamic Values by Device
/// ```dart
/// GridView.count(
///   crossAxisCount: context.byDevice(mobile: 2, tablet: 3, desktop: 4),
/// )
///
/// Padding(
///   padding: context.responsivePadding,
///   child: ...,
/// )
/// ```
///
/// ### 6. Dynamic Values by Orientation
/// ```dart
/// Container(
///   width: context.byOrientation(portrait: 200.0, landscape: 400.0),
/// )
/// ```
///
/// ### 7. ResponsiveBuilder (Custom Logic)
/// ```dart
/// ResponsiveBuilder(
///   builder: (context, deviceType, orientation) {
///     if (deviceType == DeviceType.tablet &&
///         orientation == OrientationType.landscape) {
///       return TabletLandscapeView();
///     }
///     return DefaultView();
///   },
/// )
/// ```
///
/// ### 8. Screen Dimensions
/// ```dart
/// final width = context.screenWidth;
/// final height = context.screenHeight;
/// ```

/// Size extension for convenient responsive sizing using flutter_screenutil

/// Device breakpoints for responsive layouts
class AppBreakpoints {
  AppBreakpoints._();

  /// Mobile: < 600dp
  static const double mobile = 600;

  /// Tablet: 600dp - 900dp
  static const double tablet = 900;

  /// Desktop: > 900dp
  static const double desktop = 1200;
}

/// Device type enumeration for responsive layouts
enum DeviceType { mobile, tablet, desktop }

/// Orientation type for layout decisions
enum OrientationType { portrait, landscape }

/// Responsive utilities for building adaptive layouts
class ResponsiveUtils {
  /// Get device type based on screen width
  static DeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < AppBreakpoints.mobile) {
      return DeviceType.mobile;
    } else if (width < AppBreakpoints.tablet) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }

  /// Get current orientation
  static OrientationType getOrientation(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.portrait
        ? OrientationType.portrait
        : OrientationType.landscape;
  }

  /// Check if device is mobile
  static bool isMobile(BuildContext context) =>
      getDeviceType(context) == DeviceType.mobile;

  /// Check if device is tablet
  static bool isTablet(BuildContext context) =>
      getDeviceType(context) == DeviceType.tablet;

  /// Check if device is desktop
  static bool isDesktop(BuildContext context) =>
      getDeviceType(context) == DeviceType.desktop;

  /// Check if orientation is portrait
  static bool isPortrait(BuildContext context) =>
      getOrientation(context) == OrientationType.portrait;

  /// Check if orientation is landscape
  static bool isLandscape(BuildContext context) =>
      getOrientation(context) == OrientationType.landscape;

  /// Get screen width
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  /// Get screen height
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  /// Get safe area padding
  static EdgeInsets safeAreaPadding(BuildContext context) =>
      MediaQuery.of(context).padding;

  /// Get value based on device type
  static T valueByDevice<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    final deviceType = getDeviceType(context);
    switch (deviceType) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet ?? mobile;
      case DeviceType.desktop:
        return desktop ?? tablet ?? mobile;
    }
  }

  /// Get value based on orientation
  static T valueByOrientation<T>(
    BuildContext context, {
    required T portrait,
    required T landscape,
  }) {
    return isPortrait(context) ? portrait : landscape;
  }

  /// Get responsive padding based on device type
  static EdgeInsets responsivePadding(BuildContext context) {
    return valueByDevice(
      context,
      mobile: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      tablet: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      desktop: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
    );
  }

  /// Get responsive horizontal padding
  static double responsiveHorizontalPadding(BuildContext context) {
    return valueByDevice(context, mobile: 16.0, tablet: 24.0, desktop: 32.0);
  }

  /// Get responsive grid column count
  static int responsiveGridColumns(BuildContext context) {
    return valueByDevice(context, mobile: 2, tablet: 3, desktop: 4);
  }

  /// Get responsive font scale factor
  static double responsiveFontScale(BuildContext context) {
    return valueByDevice(context, mobile: 1.0, tablet: 1.1, desktop: 1.2);
  }
}

/// A responsive builder widget that provides device and orientation info
class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({super.key, required this.builder});

  final Widget Function(
    BuildContext context,
    DeviceType deviceType,
    OrientationType orientation,
  )
  builder;

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      ResponsiveUtils.getDeviceType(context),
      ResponsiveUtils.getOrientation(context),
    );
  }
}

/// A widget that shows different layouts based on device type
class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    final deviceType = ResponsiveUtils.getDeviceType(context);
    switch (deviceType) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet ?? mobile;
      case DeviceType.desktop:
        return desktop ?? tablet ?? mobile;
    }
  }
}

/// A widget that shows different layouts based on orientation
class OrientationLayout extends StatelessWidget {
  const OrientationLayout({
    super.key,
    required this.portrait,
    required this.landscape,
  });

  final Widget portrait;
  final Widget landscape;

  @override
  Widget build(BuildContext context) {
    return ResponsiveUtils.isPortrait(context) ? portrait : landscape;
  }
}

/// Extension on BuildContext for easy responsive access
extension ResponsiveContext on BuildContext {
  /// Get device type
  DeviceType get deviceType => ResponsiveUtils.getDeviceType(this);

  /// Get orientation type
  OrientationType get orientationType => ResponsiveUtils.getOrientation(this);

  /// Check if device is mobile
  bool get isMobile => ResponsiveUtils.isMobile(this);

  /// Check if device is tablet
  bool get isTablet => ResponsiveUtils.isTablet(this);

  /// Check if device is desktop
  bool get isDesktop => ResponsiveUtils.isDesktop(this);

  /// Check if orientation is portrait
  bool get isPortrait => ResponsiveUtils.isPortrait(this);

  /// Check if orientation is landscape
  bool get isLandscape => ResponsiveUtils.isLandscape(this);

  /// Get screen width
  double get screenWidth => ResponsiveUtils.screenWidth(this);

  /// Get screen height
  double get screenHeight => ResponsiveUtils.screenHeight(this);

  /// Get responsive padding
  EdgeInsets get responsivePadding => ResponsiveUtils.responsivePadding(this);

  /// Get responsive horizontal padding
  double get responsiveHorizontalPadding =>
      ResponsiveUtils.responsiveHorizontalPadding(this);

  /// Get value based on device type
  T byDevice<T>({required T mobile, T? tablet, T? desktop}) =>
      ResponsiveUtils.valueByDevice(
        this,
        mobile: mobile,
        tablet: tablet,
        desktop: desktop,
      );

  /// Get value based on orientation
  T byOrientation<T>({required T portrait, required T landscape}) =>
      ResponsiveUtils.valueByOrientation(
        this,
        portrait: portrait,
        landscape: landscape,
      );
}

/// Initialize screen utils with responsive design size
Widget screenUtilsHandeler({required Widget child}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final width = constraints.maxWidth;

      Size designSize;

      if (width < AppBreakpoints.mobile) {
        // Mobile
        designSize = const Size(375, 812);
      } else if (width < AppBreakpoints.tablet) {
        // Tablet
        designSize = const Size(768, 1024);
      } else {
        // Desktop
        designSize = const Size(1440, 1024);
      }

      return ScreenUtilInit(
        designSize: designSize,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, _) => child,
      );
    },
  );
}

Future<void> initScreenUtilsFun() async => await ScreenUtil.ensureScreenSize();

extension SizeExtention on num {
  double get width => w;
  double get height => h;
  double get fontSize => sp;
  double get radius => r;
}
