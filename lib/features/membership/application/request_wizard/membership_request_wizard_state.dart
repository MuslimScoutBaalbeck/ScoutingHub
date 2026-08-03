part of 'membership_request_wizard_cubit.dart';

@freezed
abstract class MembershipRequestWizardState
    with _$MembershipRequestWizardState {
  const factory MembershipRequestWizardState({
    @Default(false) bool isLoading,
    @Default(0) int currentStep,
    @Default(3) int lastStep,
    MembershipLocationData? data,
    int? governorateId,
    int? districtId,
    int? cadasterId,
    int? troopId,
    String? error,
  }) = _MembershipRequestWizardState;

  const MembershipRequestWizardState._();

  List<MembershipDistrict> get availableDistricts => data?.districts
          .where((item) => item.governorateId == governorateId)
          .toList(growable: false) ??
      const [];

  List<MembershipCadaster> get availableCadasters => data?.cadasters
          .where((item) => item.districtId == districtId)
          .toList(growable: false) ??
      const [];

  List<MembershipTroop> get availableTroops => data?.troops
          .where(
            (item) =>
                item.cadasterId == cadasterId && item.acceptingMembers,
          )
          .toList(growable: false) ??
      const [];

  MembershipGovernorate? get selectedGovernorate {
    for (final item in data?.governorates ?? const <MembershipGovernorate>[]) {
      if (item.id == governorateId) {
        return item;
      }
    }
    return null;
  }

  MembershipDistrict? get selectedDistrict {
    for (final item in data?.districts ?? const <MembershipDistrict>[]) {
      if (item.id == districtId) {
        return item;
      }
    }
    return null;
  }

  MembershipCadaster? get selectedCadaster {
    for (final item in data?.cadasters ?? const <MembershipCadaster>[]) {
      if (item.id == cadasterId) {
        return item;
      }
    }
    return null;
  }

  MembershipTroop? get selectedTroop {
    for (final item in data?.troops ?? const <MembershipTroop>[]) {
      if (item.id == troopId) {
        return item;
      }
    }
    return null;
  }

  bool get sendsToCommission => cadasterId != null && availableTroops.isEmpty;

  int? get commissionId => selectedCadaster?.commissionId;

  String get destinationName =>
      selectedTroop?.name ?? selectedCadaster?.commissionName ?? '';
}
