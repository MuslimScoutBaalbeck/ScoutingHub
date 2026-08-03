enum PersonStatus { active, pending, inactive, archived }

enum ScoutStage { cub, scout, rover, leader }

final class Person {
  const Person({
    required this.id,
    required this.membershipNumber,
    required this.fullName,
    required this.phone,
    required this.stage,
    required this.unit,
    required this.status,
    required this.profileComplete,
    required this.joinedAt,
  });

  final String id;
  final String membershipNumber;
  final String fullName;
  final String phone;
  final ScoutStage stage;
  final String unit;
  final PersonStatus status;
  final bool profileComplete;
  final DateTime joinedAt;
}
