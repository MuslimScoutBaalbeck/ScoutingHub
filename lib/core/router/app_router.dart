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

    /** Authentication **/
    AutoRoute(page: WelcomeRoute.page, path: '/welcome'),
    AutoRoute(page: LoginRoute.page, path: '/login'),
    AutoRoute(page: RegisterRoute.page, path: '/register'),
    AutoRoute(page: ForgotPasswordRoute.page, path: '/forgot-password'),
    AutoRoute(page: ResetPasswordRoute.page, path: '/reset-password'),

    /** Home **/
    AutoRoute(
      page: HomeRoute.page,
      path: '/dashboard',
      children: [
        AutoRoute(page: DashboardRoute.page, path: '', initial: true),
        AutoRoute(page: TasksRoute.page, path: 'tasks'),
        AutoRoute(page: CalendarRoute.page, path: 'calendar'),
        AutoRoute(page: MoreRoute.page, path: 'more'),
      ],
    ),

    /** Troop management **/
    AutoRoute(page: PeopleRoute.page, path: '/people'),
  ];
}
