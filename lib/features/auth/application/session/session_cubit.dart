import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/auth/domain/entities/app_permission.dart';
import 'package:scouting_hub/features/auth/domain/entities/auth_session.dart';
import 'package:scouting_hub/features/auth/domain/entities/scout_assignment.dart';
import 'package:scouting_hub/features/auth/domain/usecases/logout.dart';
import 'package:scouting_hub/features/auth/domain/usecases/restore_session.dart';

part 'session_cubit.freezed.dart';
part 'session_state.dart';

@singleton
final class SessionCubit extends Cubit<SessionState> {
  SessionCubit(
    this._restoreSessionUseCase,
    this._logoutUseCase,
  ) : super(const SessionState());

  final RestoreSessionUseCase _restoreSessionUseCase;
  final LogoutUseCase _logoutUseCase;

  Future<void> restore() async {
    emit(state.copyWith(isLoading: true, error: null));

    final result = await _restoreSessionUseCase();

    result.match(
      (_) => emit(
        state.copyWith(
          isLoading: false,
          error: SessionError.restoreFailed,
        ),
      ),
      (session) => emit(
        state.copyWith(
          isLoading: false,
          session: session,
          activeAssignmentId: _resolveInitialAssignmentId(session),
          clearError: true,
        ),
      ),
    );
  }

  void setSession(AuthSession session) {
    emit(
      state.copyWith(
        session: session,
        activeAssignmentId: _resolveInitialAssignmentId(session),
        clearError: true,
      ),
    );
  }

  void selectAssignment(int assignmentId) {
    final assignmentExists = state.assignments.any(
      (assignment) => assignment.id == assignmentId,
    );

    if (!assignmentExists || state.activeAssignmentId == assignmentId) {
      return;
    }

    emit(state.copyWith(activeAssignmentId: assignmentId));
  }

  Future<void> logout() async {
    emit(state.copyWith(isLoading: true, error: null));

    final result = await _logoutUseCase();

    result.match(
      (_) => emit(
        state.copyWith(
          isLoading: false,
          error: SessionError.logoutFailed,
        ),
      ),
      (_) => emit(const SessionState()),
    );
  }

  bool can(AppPermission permission) {
    return state.user?.hasPermission(permission) ?? false;
  }

  bool canAny(Iterable<AppPermission> permissions) {
    return state.user?.hasAnyPermission(permissions) ?? false;
  }

  bool hasRole(String role) {
    return state.user?.hasRole(role) ?? false;
  }

  int? _resolveInitialAssignmentId(AuthSession? session) {
    final assignments = session?.user.assignments ?? const <ScoutAssignment>[];

    if (assignments.isEmpty) {
      return null;
    }

    for (final assignment in assignments) {
      if (assignment.isPrimary) {
        return assignment.id;
      }
    }

    return assignments.first.id;
  }
}
