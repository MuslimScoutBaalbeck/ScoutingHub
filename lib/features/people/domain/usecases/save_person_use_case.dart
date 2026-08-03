import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/people/domain/entities/person.dart';
import 'package:scouting_hub/features/people/domain/repositories/people_repository.dart';

@injectable
final class SavePersonUseCase {
  const SavePersonUseCase(this._repository);

  final PeopleRepository _repository;

  Future<Person> call(Person person) => _repository.savePerson(person);
}
