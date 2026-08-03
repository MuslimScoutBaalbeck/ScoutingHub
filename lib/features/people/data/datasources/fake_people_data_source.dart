import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/people/domain/entities/person.dart';

@lazySingleton
final class FakePeopleDataSource {
  List<Person>? _cache;

  Future<List<Person>> loadPeople() async {
    final cached = _cache;
    if (cached != null) {
      return List<Person>.unmodifiable(cached);
    }

    final source = await rootBundle.loadString(
      'assets/data/people/people.json',
    );
    final decoded = jsonDecode(source) as Map<String, dynamic>;
    final records = decoded['people'] as List<dynamic>? ?? const [];
    final people = records
        .map((record) => _mapPerson(record as Map<String, dynamic>))
        .toList(growable: true);

    _cache = people;
    return List<Person>.unmodifiable(people);
  }

  Future<Person> savePerson(Person person) async {
    final people = List<Person>.of(await loadPeople());
    final index = people.indexWhere((item) => item.id == person.id);

    if (index == -1) {
      people.insert(0, person);
    } else {
      people[index] = person;
    }

    _cache = people;
    return person;
  }

  Person _mapPerson(Map<String, dynamic> json) {
    return Person(
      id: json['id'] as String,
      membershipNumber: json['membershipNumber'] as String,
      fullName: json['fullName'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String? ?? '',
      address: json['address'] as String? ?? '',
      emergencyContact: json['emergencyContact'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      stage: ScoutStage.values.byName(json['stage'] as String),
      unit: json['unit'] as String,
      status: PersonStatus.values.byName(json['status'] as String),
      profileComplete: json['profileComplete'] as bool,
      joinedAt: DateTime.parse(json['joinedAt'] as String),
    );
  }
}
