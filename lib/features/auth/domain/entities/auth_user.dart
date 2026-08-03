import 'package:scouting_hub/features/auth/domain/entities/app_permission.dart';
import 'package:scouting_hub/features/auth/domain/entities/scout_assignment.dart';

final class AuthUser {
  const AuthUser({
    required this.id,
    required this.name,
    required this.email,
    this.roles = const [],
    this.permissions = const {},
    this.assignments = const [],
  });

  final int id;
  final String name;
  final String email;
  final List<String> roles;
  final Set<AppPermission> permissions;
  final List<ScoutAssignment> assignments;

  bool hasPermission(AppPermission permission) {
    return permissions.contains(permission);
  }

  bool hasAnyPermission(Iterable<AppPermission> requiredPermissions) {
    return requiredPermissions.any(permissions.contains);
  }

  bool hasRole(String role) {
    return roles.contains(role);
  }

  ScoutAssignment? get primaryAssignment {
    for (final assignment in assignments) {
      if (assignment.isPrimary) {
        return assignment;
      }
    }

    return assignments.isEmpty ? null : assignments.first;
  }
}
