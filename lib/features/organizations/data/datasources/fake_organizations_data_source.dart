import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/organizations/data/datasources/organizations_data_source.dart';
import 'package:scouting_hub/features/organizations/domain/entities/organization_catalog.dart';
import 'package:scouting_hub/features/organizations/domain/entities/organizational_unit.dart';
import 'package:scouting_hub/features/organizations/domain/entities/scout_organization.dart';
import 'package:scouting_hub/features/organizations/domain/entities/scout_position.dart';

@LazySingleton(as: OrganizationsDataSource)
final class FakeOrganizationsDataSource implements OrganizationsDataSource {
  OrganizationCatalog? _catalog;

  @override
  Future<OrganizationCatalog> loadCatalog() async {
    final cachedCatalog = _catalog;

    if (cachedCatalog != null) {
      return cachedCatalog;
    }

    final source = await rootBundle.loadString(
      'assets/data/organizations/organizations.json',
    );
    final json = jsonDecode(source) as Map<String, dynamic>;

    final organizations = (json['organizations'] as List<dynamic>)
        .cast<Map<String, dynamic>>()
        .map(
          (item) => ScoutOrganization(
            id: item['id'] as int,
            name: item['name'] as String,
            code: item['code'] as String,
            logoUrl: item['logo_url'] as String?,
          ),
        )
        .toList(growable: false);

    final units = (json['units'] as List<dynamic>)
        .cast<Map<String, dynamic>>()
        .map(
          (item) => OrganizationalUnit(
            id: item['id'] as int,
            organizationId: item['organization_id'] as int,
            parentId: item['parent_id'] as int?,
            name: item['name'] as String,
            type: OrganizationalUnitType.fromValue(item['type'] as String),
          ),
        )
        .toList(growable: false);

    final positions = (json['positions'] as List<dynamic>)
        .cast<Map<String, dynamic>>()
        .map(
          (item) => ScoutPosition(
            id: item['id'] as int,
            code: item['code'] as String,
            name: item['name'] as String,
            category: item['category'] as String,
          ),
        )
        .toList(growable: false);

    return _catalog = OrganizationCatalog(
      organizations: organizations,
      units: units,
      positions: positions,
    );
  }
}
