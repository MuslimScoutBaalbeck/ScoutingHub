final class ScoutAssignmentDto {
  const ScoutAssignmentDto({
    required this.id,
    required this.organizationId,
    required this.unitId,
    required this.unitName,
    required this.positionCode,
    required this.positionName,
    required this.roleNames,
    required this.isPrimary,
  });

  factory ScoutAssignmentDto.fromJson(Map<String, dynamic> json) {
    return ScoutAssignmentDto(
      id: json['id'] as int,
      organizationId: json['organization_id'] as int,
      unitId: json['unit_id'] as int,
      unitName: json['unit_name'] as String,
      positionCode: json['position_code'] as String,
      positionName: json['position_name'] as String,
      roleNames: (json['roles'] as List<dynamic>? ?? const [])
          .cast<String>(),
      isPrimary: json['is_primary'] as bool? ?? false,
    );
  }

  final int id;
  final int organizationId;
  final int unitId;
  final String unitName;
  final String positionCode;
  final String positionName;
  final List<String> roleNames;
  final bool isPrimary;
}

final class AuthUserDto {
  const AuthUserDto({
    required this.id,
    required this.name,
    required this.email,
    required this.roles,
    required this.permissions,
    required this.assignments,
  });

  factory AuthUserDto.fromJson(Map<String, dynamic> json) {
    return AuthUserDto(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      roles: (json['roles'] as List<dynamic>? ?? const []).cast<String>(),
      permissions: (json['permissions'] as List<dynamic>? ?? const [])
          .cast<String>(),
      assignments: (json['assignments'] as List<dynamic>? ?? const [])
          .map(
            (assignment) => ScoutAssignmentDto.fromJson(
              assignment as Map<String, dynamic>,
            ),
          )
          .toList(growable: false),
    );
  }

  final int id;
  final String name;
  final String email;
  final List<String> roles;
  final List<String> permissions;
  final List<ScoutAssignmentDto> assignments;
}
