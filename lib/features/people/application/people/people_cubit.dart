import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/people/domain/entities/person.dart';
import 'package:scouting_hub/features/people/domain/usecases/load_people_use_case.dart';

part 'people_cubit.freezed.dart';
part 'people_state.dart';

@injectable
final class PeopleCubit extends Cubit<PeopleState> {
  PeopleCubit(this._loadPeopleUseCase) : super(const PeopleState());

  final LoadPeopleUseCase _loadPeopleUseCase;

  Future<void> load() async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final people = await _loadPeopleUseCase();
      emit(
        state.copyWith(
          isLoading: false,
          people: people,
          filteredPeople: people,
        ),
      );
    } on Object {
      emit(state.copyWith(isLoading: false, error: PeopleError.unexpected));
    }
  }

  void search(String value) {
    final query = value.trim().toLowerCase();
    emit(
      state.copyWith(
        query: value,
        filteredPeople: state.people.where((person) {
          return query.isEmpty ||
              person.fullName.toLowerCase().contains(query) ||
              person.membershipNumber.toLowerCase().contains(query) ||
              person.phone.contains(query);
        }).toList(growable: false),
      ),
    );
  }
}
