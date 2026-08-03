import 'package:scouting_hub/features/organizations/domain/entities/organization_catalog.dart';

abstract interface class OrganizationsDataSource {
  Future<OrganizationCatalog> loadCatalog();
}
