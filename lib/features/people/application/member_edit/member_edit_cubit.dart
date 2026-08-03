import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/people/domain/entities/person.dart';
import 'package:scouting_hub/features/people/domain/usecases/save_person_use_case.dart';

part 'member_edit_cubit.freezed.dart';
part 'member_edit_state.dart';

@injectable
final class MemberEditCubit extends Cubit<MemberEditState> {
  MemberEditCubit(this._savePersonUseCase) : super(const MemberEditState());

  final SavePersonUseCase _savePersonUseCase;

  Future<void> updatePersonal({
    required Person member,
    required String fullName,
    required String phone,
    required String email,
    required String address,
    required String emergencyContact,
  }) {
    return _save(
      member.copyWith(
        fullName: fullName.trim(),
        phone: phone.trim(),
        email: email.trim(),
        address: address.trim(),
        emergencyContact: emergencyContact.trim(),
      ),
    );
  }

  Future<void> updateScout({
    required Person member,
    required String membershipNumber,
    required String unit,
    required ScoutStage stage,
    required PersonStatus status,
  }) {
    return _save(
      member.copyWith(
        membershipNumber: membershipNumber.trim(),
        unit: unit.trim(),
        stage: stage,
        status: status,
      ),
    );
  }

  Future<void> updateNotes({
    required Person member,
    required String notes,
  }) {
    return _save(member.copyWith(notes: notes.trim()));
  }

  Future<void> _save(Person member) async {
    emit(state.copyWith(isSaving: true, updatedMember: null, error: null));

    try {
      final updated = await _savePersonUseCase(member);
      emit(state.copyWith(isSaving: false, updatedMember: updated));
    } on Object {
      emit(
        state.copyWith(
          isSaving: false,
          error: MemberEditError.unexpected,
        ),
      );
    }
  }
}
