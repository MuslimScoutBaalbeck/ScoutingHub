part of 'members_list_cubit.dart';

enum MembersListError { unexpected }

@freezed
abstract class MembersListState with _$MembersListState {
  const factory MembersListState({
    @Default(false) bool isLoading,
    @Default(<Person>[]) List<Person> members,
    @Default(<Person>[]) List<Person> visibleMembers,
    ScoutStage? stage,
    PersonStatus? status,
    MembersListError? error,
  }) = _MembersListState;

  const MembersListState._();

  bool get hasActiveFilters => stage != null || status != null;
  int get visibleCount => visibleMembers.length;
}
