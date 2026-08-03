import 'package:scouting_hub/features/auth/data/dtos/auth_response_dto.dart';
import 'package:scouting_hub/features/auth/domain/entities/app_permission.dart';
import 'package:scouting_hub/features/auth/domain/entities/auth_session.dart';
import 'package:scouting_hub/features/auth/domain/entities/auth_user.dart';
import 'package:scouting_hub/features/auth/domain/entities/scout_assignment.dart';

extension AuthResponseDtoMapper on AuthResponseDto {
  AuthSession toDomain() {
    return AuthSession(
      accessToken: token,
      user: AuthUser(
        id: user.id,
        name: user.name,
        email: user.email,
        roles: List.unmodifiable(user.roles),
        permissions: user.permissions
            .map(AppPermission.fromValue)
            .whereType<AppPermission>()
            .toSet(),
        assignments: user.assignments
            .map(
              (assignment) => ScoutAssignment(
                id: assignment.id,
                organizationId: assignment.organizationId,
                unitId: assignment.unitId,
                unitName: assignment.unitName,
                positionCode: assignment.positionCode,
                positionName: assignment.positionName,
                roleNames: List.unmodifiable(assignment.roleNames),
                isPrimary: assignment.isPrimary,
              ),
            )
            .toList(growable: false),
      ),
    );
  }
}
