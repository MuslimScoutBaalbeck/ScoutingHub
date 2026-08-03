part of 'members_dashboard_cubit.dart';

enum MembersDashboardError { unexpected }

@freezed
abstract class MembersDashboardState with _$MembersDashboardState {
  const factory MembersDashboardState({
    @Default(false) bool isLoading,
    @Default(<Person>[]) List<Person> members,
    @Default(<Person>[]) List<Person> recentMembers,
    @Default(0) int totalCount,
    @Default(0) int activeCount,
    @Default(0) int pendingCount,
    @Default(0) int incompleteCount,
    MembersDashboardError? error,
  }) = _MembersDashboardState;
}
