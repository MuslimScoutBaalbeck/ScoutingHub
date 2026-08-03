import 'package:scouting_hub/features/people/domain/entities/person.dart';

abstract interface class PeopleRepository {
  Future<List<Person>> getPeople();

  Future<Person> savePerson(Person person);
}
