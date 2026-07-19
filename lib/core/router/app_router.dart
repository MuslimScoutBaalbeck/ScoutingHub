import 'package:auto_route/auto_route.dart';
import 'package:scouting_hub/core/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRouteGuard> get guards => [];

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: StartupRoute.page, path: '/', initial: true),
    AutoRoute(page: HomeRoute.page, path: '/dashboard'),
  ];
}
