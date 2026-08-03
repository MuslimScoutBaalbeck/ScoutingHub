part of 'session_cubit.dart';

enum SessionError {
  restoreFailed,
  logoutFailed,
}

@freezed
abstract class SessionState with _$SessionState {
  const factory SessionState({
    @Default(false) bool isLoading,
    AuthSession? session,
    int? activeAssignmentId,
    SessionError? error,
  }) = _SessionState;

  const SessionState._();

  bool get isAuthenticated => session != null;

  AuthUser? get user => session?.user;

  List<ScoutAssignment> get assignments =>
      user?.assignments ?? const <ScoutAssignment>[];

  ScoutAssignment? get activeAssignment {
    final selectedId = activeAssignmentId;

    if (selectedId == null) {
      return null;
    }

    for (final assignment in assignments) {
      if (assignment.id == selectedId) {
        return assignment;
      }
    }

    return null;
  }
}
