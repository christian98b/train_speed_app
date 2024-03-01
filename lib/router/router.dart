import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: DashboardRoute.page, children: [
          AutoRoute(
              page: TrainSpeedRoute.page, initial: true, maintainState: true),
          AutoRoute(page: InternetStateRoute.page, maintainState: true),
        ])
      ];
}
