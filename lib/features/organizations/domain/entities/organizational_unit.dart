enum OrganizationalUnitType {
  association,
  commission,
  troop,
  clan,
  section,
  patrol,
  committee,
  team;

  static OrganizationalUnitType fromValue(String value) {
    return OrganizationalUnitType.values.firstWhere(
      (type) => type.name == value,
      orElse: () => OrganizationalUnitType.team,
    );
  }
}

final class OrganizationalUnit {
  const OrganizationalUnit({
    required this.id,
    required this.organizationId,
    required this.name,
    required this.type,
    this.parentId,
  });

  final int id;
  final int organizationId;
  final int? parentId;
  final String name;
  final OrganizationalUnitType type;
}
