import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scouting_hub/features/auth/application/session/session_cubit.dart';
import 'package:scouting_hub/features/auth/domain/entities/app_permission.dart';

class AppPermissionGate extends StatelessWidget {
  const AppPermissionGate({
    required this.permission,
    required this.child,
    super.key,
    this.fallback = const SizedBox.shrink(),
  }) : permissions = null;

  const AppPermissionGate.any({
    required List<AppPermission> this.permissions,
    required this.child,
    super.key,
    this.fallback = const SizedBox.shrink(),
  }) : permission = null;

  final AppPermission? permission;
  final List<AppPermission>? permissions;
  final Widget child;
  final Widget fallback;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SessionCubit, SessionState, Set<AppPermission>>(
      selector: (state) => state.user?.permissions ?? const {},
      builder: (context, grantedPermissions) {
        final requiredPermission = permission;
        final requiredPermissions = permissions;

        final isAllowed = requiredPermission != null
            ? grantedPermissions.contains(requiredPermission)
            : requiredPermissions?.any(grantedPermissions.contains) ?? false;

        return isAllowed ? child : fallback;
      },
    );
  }
}
