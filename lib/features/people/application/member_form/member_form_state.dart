part of 'member_form_cubit.dart';

enum MemberFormError { unexpected }

@freezed
abstract class MemberFormState with _$MemberFormState {
  const factory MemberFormState({
    @Default(0) int currentStep,
    @Default(3) int lastStep,
    @Default(false) bool isSaving,
    @Default(false) bool isSaved,
    @Default(ScoutStage.scout) ScoutStage stage,
    @Default(PersonStatus.pending) PersonStatus status,
    Person? initialMember,
    MemberFormError? error,
  }) = _MemberFormState;

  const MemberFormState._();

  bool get isLastStep => currentStep == lastStep;
  bool get canGoBack => currentStep > 0 && !isSaving;
}
