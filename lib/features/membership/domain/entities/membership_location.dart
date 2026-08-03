final class MembershipGovernorate {
  const MembershipGovernorate({required this.id, required this.name});

  final int id;
  final String name;
}

final class MembershipDistrict {
  const MembershipDistrict({
    required this.id,
    required this.governorateId,
    required this.name,
  });

  final int id;
  final int governorateId;
  final String name;
}

final class MembershipCadaster {
  const MembershipCadaster({
    required this.id,
    required this.districtId,
    required this.name,
    required this.commissionName,
  });

  final int id;
  final int districtId;
  final String name;
  final String commissionName;
}

final class MembershipTroop {
  const MembershipTroop({
    required this.id,
    required this.cadasterId,
    required this.name,
    required this.address,
    required this.acceptingMembers,
  });

  final int id;
  final int cadasterId;
  final String name;
  final String address;
  final bool acceptingMembers;
}

final class MembershipLocationData {
  const MembershipLocationData({
    required this.governorates,
    required this.districts,
    required this.cadasters,
    required this.troops,
  });

  final List<MembershipGovernorate> governorates;
  final List<MembershipDistrict> districts;
  final List<MembershipCadaster> cadasters;
  final List<MembershipTroop> troops;
}
