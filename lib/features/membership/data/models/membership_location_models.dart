final class MembershipBootstrapResponseModel {
  const MembershipBootstrapResponseModel({required this.data});

  factory MembershipBootstrapResponseModel.fromJson(Map<String, dynamic> json) {
    return MembershipBootstrapResponseModel(
      data: MembershipBootstrapModel.fromJson(
        Map<String, dynamic>.from(json['data'] as Map),
      ),
    );
  }

  final MembershipBootstrapModel data;
}

final class MembershipBootstrapModel {
  const MembershipBootstrapModel({
    required this.defaultCountryIso2,
    required this.countries,
  });

  factory MembershipBootstrapModel.fromJson(Map<String, dynamic> json) {
    return MembershipBootstrapModel(
      defaultCountryIso2: json['default_country_iso2'] as String? ?? 'LB',
      countries: (json['countries'] as List? ?? const [])
          .map(
            (item) => MembershipCountryModel.fromJson(
              Map<String, dynamic>.from(item as Map),
            ),
          )
          .toList(growable: false),
    );
  }

  final String defaultCountryIso2;
  final List<MembershipCountryModel> countries;
}

final class MembershipCountryModel {
  const MembershipCountryModel({
    required this.id,
    required this.iso2,
    required this.name,
    required this.phoneCode,
    required this.governorates,
  });

  factory MembershipCountryModel.fromJson(Map<String, dynamic> json) {
    return MembershipCountryModel(
      id: json['id'] as int,
      iso2: json['iso2'] as String,
      name: json['name'] as String? ?? '',
      phoneCode: json['phone_code'] as String? ?? '',
      governorates: (json['governorates'] as List? ?? const [])
          .map(
            (item) => MembershipGovernorateModel.fromJson(
              Map<String, dynamic>.from(item as Map),
            ),
          )
          .toList(growable: false),
    );
  }

  final int id;
  final String iso2;
  final String name;
  final String phoneCode;
  final List<MembershipGovernorateModel> governorates;
}

final class MembershipGovernorateModel {
  const MembershipGovernorateModel({
    required this.id,
    required this.name,
    required this.districts,
  });

  factory MembershipGovernorateModel.fromJson(Map<String, dynamic> json) {
    return MembershipGovernorateModel(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      districts: (json['districts'] as List? ?? const [])
          .map(
            (item) => MembershipDistrictModel.fromJson(
              Map<String, dynamic>.from(item as Map),
            ),
          )
          .toList(growable: false),
    );
  }

  final int id;
  final String name;
  final List<MembershipDistrictModel> districts;
}

final class MembershipDistrictModel {
  const MembershipDistrictModel({
    required this.id,
    required this.name,
    required this.cadasters,
  });

  factory MembershipDistrictModel.fromJson(Map<String, dynamic> json) {
    return MembershipDistrictModel(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      cadasters: (json['cadasters'] as List? ?? const [])
          .map(
            (item) => MembershipCadasterModel.fromJson(
              Map<String, dynamic>.from(item as Map),
            ),
          )
          .toList(growable: false),
    );
  }

  final int id;
  final String name;
  final List<MembershipCadasterModel> cadasters;
}

final class MembershipCadasterModel {
  const MembershipCadasterModel({required this.id, required this.name});

  factory MembershipCadasterModel.fromJson(Map<String, dynamic> json) {
    return MembershipCadasterModel(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
    );
  }

  final int id;
  final String name;
}
