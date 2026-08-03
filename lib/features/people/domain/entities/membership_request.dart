enum MembershipRequestStatus {
  submitted,
  underReview,
  needsInformation,
  approved,
  rejected,
}

final class MembershipRequest {
  const MembershipRequest({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.stage,
    required this.status,
    required this.submittedAt,
    this.email = '',
    this.address = '',
    this.notes = '',
  });

  final String id;
  final String fullName;
  final String phone;
  final String email;
  final String address;
  final String stage;
  final String notes;
  final MembershipRequestStatus status;
  final DateTime submittedAt;

  MembershipRequest copyWith({
    String? fullName,
    String? phone,
    String? email,
    String? address,
    String? stage,
    String? notes,
    MembershipRequestStatus? status,
  }) {
    return MembershipRequest(
      id: id,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      stage: stage ?? this.stage,
      notes: notes ?? this.notes,
      status: status ?? this.status,
      submittedAt: submittedAt,
    );
  }
}
