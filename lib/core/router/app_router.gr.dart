// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/material.dart' as _i21;
import 'package:scouting_hub/features/auth/presentation/pages/forgot_password_page.dart'
    as _i4;
import 'package:scouting_hub/features/auth/presentation/pages/login_page.dart'
    as _i6;
import 'package:scouting_hub/features/auth/presentation/pages/register_page.dart'
    as _i14;
import 'package:scouting_hub/features/auth/presentation/pages/reset_password_page.dart'
    as _i15;
import 'package:scouting_hub/features/auth/presentation/pages/welcome_page.dart'
    as _i18;
import 'package:scouting_hub/features/calendar/presentation/pages/calendar_page.dart'
    as _i2;
import 'package:scouting_hub/features/dashboard/presentation/pages/dashboard_page.dart'
    as _i3;
import 'package:scouting_hub/features/home/presentation/pages/home_page.dart'
    as _i5;
import 'package:scouting_hub/features/membership/presentation/pages/applicant_access_page.dart'
    as _i1;
import 'package:scouting_hub/features/more/presentation/pages/more_page.dart'
    as _i13;
import 'package:scouting_hub/features/people/domain/entities/person.dart'
    as _i20;
import 'package:scouting_hub/features/people/presentation/pages/member_create_wizard_page.dart'
    as _i7;
import 'package:scouting_hub/features/people/presentation/pages/member_details_page.dart'
    as _i8;
import 'package:scouting_hub/features/people/presentation/pages/member_reports_page.dart'
    as _i9;
import 'package:scouting_hub/features/people/presentation/pages/members_dashboard_page.dart'
    as _i10;
import 'package:scouting_hub/features/people/presentation/pages/members_list_page.dart'
    as _i11;
import 'package:scouting_hub/features/people/presentation/pages/membership_requests_page.dart'
    as _i12;
import 'package:scouting_hub/features/startup/presentation/pages/startup_page.dart'
    as _i16;
import 'package:scouting_hub/features/tasks/presentation/pages/tasks_page.dart'
    as _i17;

/// generated route for
/// [_i1.ApplicantAccessPage]
class ApplicantAccessRoute extends _i19.PageRouteInfo<void> {
  const ApplicantAccessRoute({List<_i19.PageRouteInfo>? children})
    : super(ApplicantAccessRoute.name, initialChildren: children);

  static const String name = 'ApplicantAccessRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return _i19.WrappedRoute(child: const _i1.ApplicantAccessPage());
    },
  );
}

/// generated route for
/// [_i2.CalendarPage]
class CalendarRoute extends _i19.PageRouteInfo<void> {
  const CalendarRoute({List<_i19.PageRouteInfo>? children})
    : super(CalendarRoute.name, initialChildren: children);

  static const String name = 'CalendarRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i2.CalendarPage();
    },
  );
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i19.PageRouteInfo<void> {
  const DashboardRoute({List<_i19.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i3.DashboardPage();
    },
  );
}

/// generated route for
/// [_i4.ForgotPasswordPage]
class ForgotPasswordRoute extends _i19.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i19.PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return _i19.WrappedRoute(child: const _i4.ForgotPasswordPage());
    },
  );
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i19.PageRouteInfo<void> {
  const HomeRoute({List<_i19.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomePage();
    },
  );
}

/// generated route for
/// [_i6.LoginPage]
class LoginRoute extends _i19.PageRouteInfo<void> {
  const LoginRoute({List<_i19.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return _i19.WrappedRoute(child: const _i6.LoginPage());
    },
  );
}

/// generated route for
/// [_i7.MemberCreateWizardPage]
class MemberCreateWizardRoute extends _i19.PageRouteInfo<void> {
  const MemberCreateWizardRoute({List<_i19.PageRouteInfo>? children})
    : super(MemberCreateWizardRoute.name, initialChildren: children);

  static const String name = 'MemberCreateWizardRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return _i19.WrappedRoute(child: const _i7.MemberCreateWizardPage());
    },
  );
}

/// generated route for
/// [_i8.MemberDetailsPage]
class MemberDetailsRoute extends _i19.PageRouteInfo<MemberDetailsRouteArgs> {
  MemberDetailsRoute({
    required _i20.Person person,
    _i21.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         MemberDetailsRoute.name,
         args: MemberDetailsRouteArgs(person: person, key: key),
         initialChildren: children,
       );

  static const String name = 'MemberDetailsRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MemberDetailsRouteArgs>();
      return _i19.WrappedRoute(
        child: _i8.MemberDetailsPage(person: args.person, key: args.key),
      );
    },
  );
}

class MemberDetailsRouteArgs {
  const MemberDetailsRouteArgs({required this.person, this.key});

  final _i20.Person person;

  final _i21.Key? key;

  @override
  String toString() {
    return 'MemberDetailsRouteArgs{person: $person, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MemberDetailsRouteArgs) return false;
    return person == other.person && key == other.key;
  }

  @override
  int get hashCode => person.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i9.MemberReportsPage]
class MemberReportsRoute extends _i19.PageRouteInfo<void> {
  const MemberReportsRoute({List<_i19.PageRouteInfo>? children})
    : super(MemberReportsRoute.name, initialChildren: children);

  static const String name = 'MemberReportsRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i9.MemberReportsPage();
    },
  );
}

/// generated route for
/// [_i10.MembersDashboardPage]
class MembersDashboardRoute extends _i19.PageRouteInfo<void> {
  const MembersDashboardRoute({List<_i19.PageRouteInfo>? children})
    : super(MembersDashboardRoute.name, initialChildren: children);

  static const String name = 'MembersDashboardRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return _i19.WrappedRoute(child: const _i10.MembersDashboardPage());
    },
  );
}

/// generated route for
/// [_i11.MembersListPage]
class MembersListRoute extends _i19.PageRouteInfo<void> {
  const MembersListRoute({List<_i19.PageRouteInfo>? children})
    : super(MembersListRoute.name, initialChildren: children);

  static const String name = 'MembersListRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return _i19.WrappedRoute(child: const _i11.MembersListPage());
    },
  );
}

/// generated route for
/// [_i12.MembershipRequestsPage]
class MembershipRequestsRoute extends _i19.PageRouteInfo<void> {
  const MembershipRequestsRoute({List<_i19.PageRouteInfo>? children})
    : super(MembershipRequestsRoute.name, initialChildren: children);

  static const String name = 'MembershipRequestsRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return _i19.WrappedRoute(child: const _i12.MembershipRequestsPage());
    },
  );
}

/// generated route for
/// [_i13.MorePage]
class MoreRoute extends _i19.PageRouteInfo<void> {
  const MoreRoute({List<_i19.PageRouteInfo>? children})
    : super(MoreRoute.name, initialChildren: children);

  static const String name = 'MoreRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i13.MorePage();
    },
  );
}

/// generated route for
/// [_i14.RegisterPage]
class RegisterRoute extends _i19.PageRouteInfo<void> {
  const RegisterRoute({List<_i19.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return _i19.WrappedRoute(child: const _i14.RegisterPage());
    },
  );
}

/// generated route for
/// [_i15.ResetPasswordPage]
class ResetPasswordRoute extends _i19.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    required String email,
    _i21.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         ResetPasswordRoute.name,
         args: ResetPasswordRouteArgs(email: email, key: key),
         initialChildren: children,
       );

  static const String name = 'ResetPasswordRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResetPasswordRouteArgs>();
      return _i19.WrappedRoute(
        child: _i15.ResetPasswordPage(email: args.email, key: args.key),
      );
    },
  );
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({required this.email, this.key});

  final String email;

  final _i21.Key? key;

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
/// [_i16.StartupPage]
class StartupRoute extends _i19.PageRouteInfo<void> {
  const StartupRoute({List<_i19.PageRouteInfo>? children})
    : super(StartupRoute.name, initialChildren: children);

  static const String name = 'StartupRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i16.StartupPage();
    },
  );
}

/// generated route for
/// [_i17.TasksPage]
class TasksRoute extends _i19.PageRouteInfo<void> {
  const TasksRoute({List<_i19.PageRouteInfo>? children})
    : super(TasksRoute.name, initialChildren: children);

  static const String name = 'TasksRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i17.TasksPage();
    },
  );
}

/// generated route for
/// [_i18.WelcomePage]
class WelcomeRoute extends _i19.PageRouteInfo<void> {
  const WelcomeRoute({List<_i19.PageRouteInfo>? children})
    : super(WelcomeRoute.name, initialChildren: children);

  static const String name = 'WelcomeRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i18.WelcomePage();
    },
  );
}
