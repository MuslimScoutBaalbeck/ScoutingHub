final class ScoutAssignment {
  const ScoutAssignment({
    required this.id,
    required this.organizationId,
    required this.unitId,
    required this.unitName,
    required this.positionCode,
    required this.positionName,
    required this.roleNames,
    this.isPrimary = false,
  });

  final int id;
  final int organizationId;
  final int unitId;
  final String unitName;
  final String positionCode;
  final String positionName;
  final List<String> roleNames;
  final bool isPrimary;
}
