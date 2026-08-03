part of 'people_cubit.dart';

enum PeopleError { unexpected }

@freezed
abstract class PeopleState with _$PeopleState {
  const factory PeopleState({
    @Default(false) bool isLoading,
    @Default(<Person>[]) List<Person> people,
    @Default(<Person>[]) List<Person> filteredPeople,
    @Default('') String query,
    PeopleError? error,
  }) = _PeopleState;
}
