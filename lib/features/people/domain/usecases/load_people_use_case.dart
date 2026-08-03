import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/people/domain/entities/person.dart';
import 'package:scouting_hub/features/people/domain/repositories/people_repository.dart';

@injectable
final class LoadPeopleUseCase {
  const LoadPeopleUseCase(this._repository);

  final PeopleRepository _repository;

  Future<List<Person>> call() => _repository.getPeople();
}
