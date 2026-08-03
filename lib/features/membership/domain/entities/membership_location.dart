import 'package:scouting_hub/core/i18n/translations.g.dart';

bool get _isArabic => LocaleSettings.currentLocale.languageCode == 'ar';

final class MembershipGovernorate {
  const MembershipGovernorate({
    required this.id,
    required this.nameEn,
    required this.nameAr,
  });

  final int id;
  final String nameEn;
  final String nameAr;

  String get name => _isArabic ? nameAr : nameEn;
}

final class MembershipDistrict {
  const MembershipDistrict({
    required this.id,
    required this.governorateId,
    required this.nameEn,
    required this.nameAr,
  });

  final int id;
  final int governorateId;
  final String nameEn;
  final String nameAr;

  String get name => _isArabic ? nameAr : nameEn;
}

final class MembershipCadaster {
  const MembershipCadaster({
    required this.id,
    required this.districtId,
    required this.nameEn,
    required this.nameAr,
    required this.commissionId,
    required this.commissionNameEn,
    required this.commissionNameAr,
  });

  final int id;
  final int districtId;
  final String nameEn;
  final String nameAr;
  final int commissionId;
  final String commissionNameEn;
  final String commissionNameAr;

  String get name => _isArabic ? nameAr : nameEn;
  String get commissionName =>
      _isArabic ? commissionNameAr : commissionNameEn;
}

final class MembershipTroop {
  const MembershipTroop({
    required this.id,
    required this.cadasterId,
    required this.nameEn,
    required this.nameAr,
    required this.addressEn,
    required this.addressAr,
    required this.acceptingMembers,
  });

  final int id;
  final int cadasterId;
  final String nameEn;
  final String nameAr;
  final String addressEn;
  final String addressAr;
  final bool acceptingMembers;

  String get name => _isArabic ? nameAr : nameEn;
  String get address => _isArabic ? addressAr : addressEn;
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
