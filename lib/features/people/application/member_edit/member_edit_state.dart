part of 'member_edit_cubit.dart';

enum MemberEditError { unexpected }

@freezed
abstract class MemberEditState with _$MemberEditState {
  const factory MemberEditState({
    @Default(false) bool isSaving,
    Person? updatedMember,
    MemberEditError? error,
  }) = _MemberEditState;
}
