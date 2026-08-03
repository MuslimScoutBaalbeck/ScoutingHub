import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/people/domain/entities/person.dart';
import 'package:scouting_hub/features/people/domain/usecases/load_people_use_case.dart';

part 'members_list_cubit.freezed.dart';
part 'members_list_state.dart';

@injectable
final class MembersListCubit extends Cubit<MembersListState> {
  MembersListCubit(this._loadPeopleUseCase) : super(const MembersListState());

  final LoadPeopleUseCase _loadPeopleUseCase;

  Future<void> load() async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final members = await _loadPeopleUseCase();
      emit(
        state.copyWith(
          isLoading: false,
          members: members,
          visibleMembers: _filter(
            members,
            stage: state.stage,
            status: state.status,
          ),
        ),
      );
    } on Object {
      emit(
        state.copyWith(
          isLoading: false,
          error: MembersListError.unexpected,
        ),
      );
    }
  }

  void applyFilters({ScoutStage? stage, PersonStatus? status}) {
    emit(
      state.copyWith(
        stage: stage,
        status: status,
        visibleMembers: _filter(state.members, stage: stage, status: status),
      ),
    );
  }

  void clearFilters() {
    emit(
      state.copyWith(
        stage: null,
        status: null,
        visibleMembers: state.members,
      ),
    );
  }

  List<Person> search(String value) {
    final query = value.trim().toLowerCase();

    return state.members
        .where((member) {
          return query.isEmpty ||
              member.fullName.toLowerCase().contains(query) ||
              member.membershipNumber.toLowerCase().contains(query) ||
              member.phone.contains(query);
        })
        .toList(growable: false);
  }

  List<Person> _filter(
    List<Person> members, {
    ScoutStage? stage,
    PersonStatus? status,
  }) {
    return members
        .where((member) {
          return (stage == null || member.stage == stage) &&
              (status == null || member.status == status);
        })
        .toList(growable: false);
  }
}
