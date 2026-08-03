import 'package:scouting_hub/features/organizations/domain/entities/organizational_unit.dart';
import 'package:scouting_hub/features/organizations/domain/entities/scout_organization.dart';
import 'package:scouting_hub/features/organizations/domain/entities/scout_position.dart';

final class OrganizationCatalog {
  const OrganizationCatalog({
    required this.organizations,
    required this.units,
    required this.positions,
  });

  final List<ScoutOrganization> organizations;
  final List<OrganizationalUnit> units;
  final List<ScoutPosition> positions;
}
