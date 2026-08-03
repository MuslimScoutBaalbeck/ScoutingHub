part of 'member_create_cubit.dart';

enum MemberCreateError { unexpected }

@freezed
abstract class MemberCreateState with _$MemberCreateState {
  const factory MemberCreateState({
    @Default(0) int currentStep,
    @Default(ScoutStage.scout) ScoutStage stage,
    @Default(PersonStatus.pending) PersonStatus status,
    @Default(false) bool isSaving,
    @Default(false) bool isSaved,
    MemberCreateError? error,
  }) = _MemberCreateState;
}
