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
    this.email = '',
    this.address = '',
    this.dateOfBirth,
    this.emergencyContact = '',
    this.notes = '',
  });

  final String id;
  final String membershipNumber;
  final String fullName;
  final String phone;
  final String email;
  final String address;
  final DateTime? dateOfBirth;
  final String emergencyContact;
  final String notes;
  final ScoutStage stage;
  final String unit;
  final PersonStatus status;
  final bool profileComplete;
  final DateTime joinedAt;

  Person copyWith({
    String? id,
    String? membershipNumber,
    String? fullName,
    String? phone,
    String? email,
    String? address,
    DateTime? dateOfBirth,
    String? emergencyContact,
    String? notes,
    ScoutStage? stage,
    String? unit,
    PersonStatus? status,
    bool? profileComplete,
    DateTime? joinedAt,
  }) {
    return Person(
      id: id ?? this.id,
      membershipNumber: membershipNumber ?? this.membershipNumber,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      emergencyContact: emergencyContact ?? this.emergencyContact,
      notes: notes ?? this.notes,
      stage: stage ?? this.stage,
      unit: unit ?? this.unit,
      status: status ?? this.status,
      profileComplete: profileComplete ?? this.profileComplete,
      joinedAt: joinedAt ?? this.joinedAt,
    );
  }
}
