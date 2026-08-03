import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/people/domain/entities/person.dart';
import 'package:scouting_hub/features/people/domain/usecases/save_person_use_case.dart';

part 'member_create_cubit.freezed.dart';
part 'member_create_state.dart';

@injectable
final class MemberCreateCubit extends Cubit<MemberCreateState> {
  MemberCreateCubit(this._savePersonUseCase) : super(const MemberCreateState());

  final SavePersonUseCase _savePersonUseCase;

  void goToStep(int step) {
    if (state.isSaving || step < 0 || step > 3) return;
    emit(state.copyWith(currentStep: step));
  }

  void nextStep() => goToStep(state.currentStep + 1);

  void previousStep() => goToStep(state.currentStep - 1);

  void stageChanged(ScoutStage value) => emit(state.copyWith(stage: value));

  void statusChanged(PersonStatus value) => emit(state.copyWith(status: value));

  Future<void> create({
    required String fullName,
    required String phone,
    required String email,
    required String address,
    required String emergencyContact,
    required String membershipNumber,
    required String unit,
    required String notes,
  }) async {
    emit(state.copyWith(isSaving: true, isSaved: false, error: null));

    try {
      final member = Person(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        membershipNumber: membershipNumber.trim(),
        fullName: fullName.trim(),
        phone: phone.trim(),
        email: email.trim(),
        address: address.trim(),
        emergencyContact: emergencyContact.trim(),
        notes: notes.trim(),
        stage: state.stage,
        unit: unit.trim(),
        status: state.status,
        profileComplete:
            fullName.trim().isNotEmpty &&
            phone.trim().isNotEmpty &&
            membershipNumber.trim().isNotEmpty &&
            unit.trim().isNotEmpty,
        joinedAt: DateTime.now(),
      );

      await _savePersonUseCase(member);
      emit(state.copyWith(isSaving: false, isSaved: true));
    } on Object {
      emit(
        state.copyWith(
          isSaving: false,
          error: MemberCreateError.unexpected,
        ),
      );
    }
  }
}
