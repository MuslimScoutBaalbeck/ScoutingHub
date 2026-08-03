// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:scouting_hub/features/auth/presentation/pages/forgot_password_page.dart'
    as _i3;
import 'package:scouting_hub/features/auth/presentation/pages/login_page.dart'
    as _i5;
import 'package:scouting_hub/features/auth/presentation/pages/register_page.dart'
    as _i7;
import 'package:scouting_hub/features/auth/presentation/pages/reset_password_page.dart'
    as _i8;
import 'package:scouting_hub/features/auth/presentation/pages/welcome_page.dart'
    as _i11;
import 'package:scouting_hub/features/calendar/presentation/pages/calendar_page.dart'
    as _i1;
import 'package:scouting_hub/features/dashboard/presentation/pages/dashboard_page.dart'
    as _i2;
import 'package:scouting_hub/features/home/presentation/pages/home_page.dart'
    as _i4;
import 'package:scouting_hub/features/more/presentation/pages/more_page.dart'
    as _i6;
import 'package:scouting_hub/features/startup/presentation/pages/startup_page.dart'
    as _i9;
import 'package:scouting_hub/features/tasks/presentation/pages/tasks_page.dart'
    as _i10;

/// generated route for
/// [_i1.CalendarPage]
class CalendarRoute extends _i12.PageRouteInfo<void> {
  const CalendarRoute({List<_i12.PageRouteInfo>? children})
    : super(CalendarRoute.name, initialChildren: children);

  static const String name = 'CalendarRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i1.CalendarPage();
    },
  );
}

/// generated route for
/// [_i2.DashboardPage]
class DashboardRoute extends _i12.PageRouteInfo<void> {
  const DashboardRoute({List<_i12.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i2.DashboardPage();
    },
  );
}

/// generated route for
/// [_i3.ForgotPasswordPage]
class ForgotPasswordRoute extends _i12.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i12.PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return _i12.WrappedRoute(child: const _i3.ForgotPasswordPage());
    },
  );
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomePage();
    },
  );
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute({List<_i12.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return _i12.WrappedRoute(child: const _i5.LoginPage());
    },
  );
}

/// generated route for
/// [_i6.MorePage]
class MoreRoute extends _i12.PageRouteInfo<void> {
  const MoreRoute({List<_i12.PageRouteInfo>? children})
    : super(MoreRoute.name, initialChildren: children);

  static const String name = 'MoreRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i6.MorePage();
    },
  );
}

/// generated route for
/// [_i7.RegisterPage]
class RegisterRoute extends _i12.PageRouteInfo<void> {
  const RegisterRoute({List<_i12.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return _i12.WrappedRoute(child: const _i7.RegisterPage());
    },
  );
}

/// generated route for
/// [_i8.ResetPasswordPage]
class ResetPasswordRoute extends _i12.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    required String email,
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
         ResetPasswordRoute.name,
         args: ResetPasswordRouteArgs(email: email, key: key),
         initialChildren: children,
       );

  static const String name = 'ResetPasswordRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResetPasswordRouteArgs>();
      return _i12.WrappedRoute(
        child: _i8.ResetPasswordPage(email: args.email, key: args.key),
      );
    },
  );
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({required this.email, this.key});

  final String email;

  final _i13.Key? key;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{email: $email, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ResetPasswordRouteArgs) return false;
    return email == other.email && key == other.key;
  }

  @override
  int get hashCode => email.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i9.StartupPage]
class StartupRoute extends _i12.PageRouteInfo<void> {
  const StartupRoute({List<_i12.PageRouteInfo>? children})
    : super(StartupRoute.name, initialChildren: children);

  static const String name = 'StartupRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i9.StartupPage();
    },
  );
}

/// generated route for
/// [_i10.TasksPage]
class TasksRoute extends _i12.PageRouteInfo<void> {
  const TasksRoute({List<_i12.PageRouteInfo>? children})
    : super(TasksRoute.name, initialChildren: children);

  static const String name = 'TasksRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i10.TasksPage();
    },
  );
}

/// generated route for
/// [_i11.WelcomePage]
class WelcomeRoute extends _i12.PageRouteInfo<void> {
  const WelcomeRoute({List<_i12.PageRouteInfo>? children})
    : super(WelcomeRoute.name, initialChildren: children);

  static const String name = 'WelcomeRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i11.WelcomePage();
    },
  );
}
