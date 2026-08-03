import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/membership/domain/entities/membership_location.dart';

part 'membership_request_wizard_cubit.freezed.dart';
part 'membership_request_wizard_state.dart';

@injectable
final class MembershipRequestWizardCubit
    extends Cubit<MembershipRequestWizardState> {
  MembershipRequestWizardCubit()
      : super(const MembershipRequestWizardState());

  Future<void> load() async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final source = await rootBundle.loadString(
        'assets/data/membership/locations.json',
      );
      final json = jsonDecode(source) as Map<String, dynamic>;
      final data = MembershipLocationData(
        governorates: (json['governorates'] as List<dynamic>)
            .map((item) {
              final map = item as Map<String, dynamic>;
              return MembershipGovernorate(
                id: map['id'] as int,
                nameEn: map['nameEn'] as String,
                nameAr: map['nameAr'] as String,
              );
            })
            .toList(growable: false),
        districts: (json['districts'] as List<dynamic>)
            .map((item) {
              final map = item as Map<String, dynamic>;
              return MembershipDistrict(
                id: map['id'] as int,
                governorateId: map['governorateId'] as int,
                nameEn: map['nameEn'] as String,
                nameAr: map['nameAr'] as String,
              );
            })
            .toList(growable: false),
        cadasters: (json['cadasters'] as List<dynamic>)
            .map((item) {
              final map = item as Map<String, dynamic>;
              return MembershipCadaster(
                id: map['id'] as int,
                districtId: map['districtId'] as int,
                nameEn: map['nameEn'] as String,
                nameAr: map['nameAr'] as String,
                commissionId: map['commissionId'] as int,
                commissionNameEn: map['commissionNameEn'] as String,
                commissionNameAr: map['commissionNameAr'] as String,
              );
            })
            .toList(growable: false),
        troops: (json['troops'] as List<dynamic>)
            .map((item) {
              final map = item as Map<String, dynamic>;
              return MembershipTroop(
                id: map['id'] as int,
                cadasterId: map['cadasterId'] as int,
                nameEn: map['nameEn'] as String,
                nameAr: map['nameAr'] as String,
                addressEn: map['addressEn'] as String,
                addressAr: map['addressAr'] as String,
                acceptingMembers: map['acceptingMembers'] as bool,
              );
            })
            .toList(growable: false),
      );

      emit(state.copyWith(isLoading: false, data: data));
    } on Object {
      emit(state.copyWith(isLoading: false, error: 'load_failed'));
    }
  }

  void selectGovernorate(int? id) {
    emit(
      state.copyWith(
        governorateId: id,
        districtId: null,
        cadasterId: null,
        troopId: null,
      ),
    );
  }

  void selectDistrict(int? id) {
    emit(
      state.copyWith(
        districtId: id,
        cadasterId: null,
        troopId: null,
      ),
    );
  }

  void selectCadaster(int? id) {
    emit(state.copyWith(cadasterId: id, troopId: null));
  }

  void selectTroop(int? id) => emit(state.copyWith(troopId: id));

  void nextStep() {
    if (state.currentStep < state.lastStep) {
      emit(state.copyWith(currentStep: state.currentStep + 1));
    }
  }

  void previousStep() {
    if (state.currentStep > 0) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }
}
