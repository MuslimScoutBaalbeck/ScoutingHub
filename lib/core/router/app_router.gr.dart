// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:scouting_hub/features/auth/presentation/pages/forgot_password_page.dart'
    as _i1;
import 'package:scouting_hub/features/auth/presentation/pages/login_page.dart'
    as _i3;
import 'package:scouting_hub/features/auth/presentation/pages/register_page.dart'
    as _i4;
import 'package:scouting_hub/features/auth/presentation/pages/reset_password_page.dart'
    as _i5;
import 'package:scouting_hub/features/auth/presentation/pages/welcome_page.dart'
    as _i7;
import 'package:scouting_hub/features/home/presentation/pages/home_page.dart'
    as _i2;
import 'package:scouting_hub/features/startup/presentation/pages/startup_page.dart'
    as _i6;

/// generated route for
/// [_i1.ForgotPasswordPage]
class ForgotPasswordRoute extends _i8.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i8.PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return _i8.WrappedRoute(child: const _i1.ForgotPasswordPage());
    },
  );
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return _i8.WrappedRoute(child: const _i3.LoginPage());
    },
  );
}

/// generated route for
/// [_i4.RegisterPage]
class RegisterRoute extends _i8.PageRouteInfo<void> {
  const RegisterRoute({List<_i8.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return _i8.WrappedRoute(child: const _i4.RegisterPage());
    },
  );
}

/// generated route for
/// [_i5.ResetPasswordPage]
class ResetPasswordRoute extends _i8.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    required String email,
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         ResetPasswordRoute.name,
         args: ResetPasswordRouteArgs(email: email, key: key),
         initialChildren: children,
       );

  static const String name = 'ResetPasswordRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResetPasswordRouteArgs>();
      return _i8.WrappedRoute(
        child: _i5.ResetPasswordPage(email: args.email, key: args.key),
      );
    },
  );
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({required this.email, this.key});

  final String email;

  final _i9.Key? key;

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
/// [_i6.StartupPage]
class StartupRoute extends _i8.PageRouteInfo<void> {
  const StartupRoute({List<_i8.PageRouteInfo>? children})
    : super(StartupRoute.name, initialChildren: children);

  static const String name = 'StartupRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.StartupPage();
    },
  );
}

/// generated route for
/// [_i7.WelcomePage]
class WelcomeRoute extends _i8.PageRouteInfo<void> {
  const WelcomeRoute({List<_i8.PageRouteInfo>? children})
    : super(WelcomeRoute.name, initialChildren: children);

  static const String name = 'WelcomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.WelcomePage();
    },
  );
}
