// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:deutschebahn/pages/dashboard/dashboard_page.dart' as _i1;
import 'package:deutschebahn/pages/dashboard/pages/internet_state_page.dart'
    as _i2;
import 'package:deutschebahn/pages/dashboard/pages/train_speed_page.dart'
    as _i4;
import 'package:deutschebahn/pages/splash/splash_page.dart' as _i3;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardPage(),
      );
    },
    InternetStateRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.InternetStatePage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SplashPage(),
      );
    },
    TrainSpeedRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.TrainSpeedPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i5.PageRouteInfo<void> {
  const DashboardRoute({List<_i5.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.InternetStatePage]
class InternetStateRoute extends _i5.PageRouteInfo<void> {
  const InternetStateRoute({List<_i5.PageRouteInfo>? children})
      : super(
          InternetStateRoute.name,
          initialChildren: children,
        );

  static const String name = 'InternetStateRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.TrainSpeedPage]
class TrainSpeedRoute extends _i5.PageRouteInfo<void> {
  const TrainSpeedRoute({List<_i5.PageRouteInfo>? children})
      : super(
          TrainSpeedRoute.name,
          initialChildren: children,
        );

  static const String name = 'TrainSpeedRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
