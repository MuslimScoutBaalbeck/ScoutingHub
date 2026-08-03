import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/people/domain/entities/person.dart';
import 'package:scouting_hub/features/people/domain/usecases/save_person_use_case.dart';

part 'member_form_cubit.freezed.dart';
part 'member_form_state.dart';

@injectable
final class MemberFormCubit extends Cubit<MemberFormState> {
  MemberFormCubit(this._savePersonUseCase) : super(const MemberFormState());

  final SavePersonUseCase _savePersonUseCase;

  void initialize(Person? member) {
    emit(
      state.copyWith(
        initialMember: member,
        stage: member?.stage ?? ScoutStage.scout,
        status: member?.status ?? PersonStatus.pending,
      ),
    );
  }

  void goToStep(int step) {
    if (state.isSaving || step < 0 || step > state.lastStep) {
      return;
    }

    emit(state.copyWith(currentStep: step));
  }

  void nextStep() {
    if (state.isSaving || state.currentStep >= state.lastStep) {
      return;
    }

    emit(state.copyWith(currentStep: state.currentStep + 1));
  }

  void previousStep() {
    if (state.isSaving || state.currentStep == 0) {
      return;
    }

    emit(state.copyWith(currentStep: state.currentStep - 1));
  }

  void changeStage(ScoutStage stage) => emit(state.copyWith(stage: stage));

  void changeStatus(PersonStatus status) => emit(state.copyWith(status: status));

  Future<bool> save({
    required String fullName,
    required String phone,
    required String email,
    required String address,
    required String membershipNumber,
    required String unit,
    required String emergencyContact,
    required String notes,
  }) async {
    if (state.isSaving) {
      return false;
    }

    emit(state.copyWith(isSaving: true, error: null, isSaved: false));

    try {
      final previous = state.initialMember;
      final member = Person(
        id: previous?.id ?? DateTime.now().microsecondsSinceEpoch.toString(),
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
        profileComplete: fullName.trim().isNotEmpty &&
            phone.trim().isNotEmpty &&
            membershipNumber.trim().isNotEmpty &&
            unit.trim().isNotEmpty,
        joinedAt: previous?.joinedAt ?? DateTime.now(),
        dateOfBirth: previous?.dateOfBirth,
      );

      await _savePersonUseCase(member);
      emit(state.copyWith(isSaving: false, isSaved: true));
      return true;
    } on Object {
      emit(
        state.copyWith(
          isSaving: false,
          error: MemberFormError.unexpected,
        ),
      );
      return false;
    }
  }
}
