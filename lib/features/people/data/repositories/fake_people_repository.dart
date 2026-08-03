import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/people/data/datasources/fake_people_data_source.dart';
import 'package:scouting_hub/features/people/domain/entities/person.dart';
import 'package:scouting_hub/features/people/domain/repositories/people_repository.dart';

@LazySingleton(as: PeopleRepository)
final class FakePeopleRepository implements PeopleRepository {
  const FakePeopleRepository(this._dataSource);

  final FakePeopleDataSource _dataSource;

  @override
  Future<List<Person>> getPeople() => _dataSource.loadPeople();

  @override
  Future<Person> savePerson(Person person) => _dataSource.savePerson(person);
}
