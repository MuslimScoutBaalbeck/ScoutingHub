import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'applicant_access_cubit.freezed.dart';
part 'applicant_access_state.dart';

enum ApplicantDestination {
  verifyEmail,
  membershipRequest,
  requestStatus,
  home,
}

enum ApplicantRequestStatus {
  none,
  submitted,
  underReview,
  needsInformation,
  approved,
  rejected,
}

enum ApplicantRequestType {
  troopMembership,
  commissionInterest,
}

@singleton
final class ApplicantAccessCubit extends HydratedCubit<ApplicantAccessState> {
  ApplicantAccessCubit() : super(const ApplicantAccessState());

  void startSession({required String email}) {
    if (state.email == email) {
      return;
    }

    emit(ApplicantAccessState(email: email));
  }

  void markEmailVerified() {
    emit(state.copyWith(emailVerified: true));
  }

  void submitMembershipRequest({
    required String requestId,
    ApplicantRequestType? requestType,
    int? governorateId,
    int? districtId,
    int? cadasterId,
    int? troopId,
    int? commissionId,
    String? destinationName,
  }) {
    emit(
      state.copyWith(
        requestId: requestId,
        requestStatus: ApplicantRequestStatus.submitted,
        requestType: requestType,
        governorateId: governorateId,
        districtId: districtId,
        cadasterId: cadasterId,
        troopId: troopId,
        commissionId: commissionId,
        destinationName: destinationName,
      ),
    );
  }

  void updateRequestStatus(ApplicantRequestStatus status) {
    emit(state.copyWith(requestStatus: status));
  }

  void reset() => emit(const ApplicantAccessState());

  @override
  ApplicantAccessState? fromJson(Map<String, dynamic> json) {
    return ApplicantAccessState(
      email: json['email'] as String?,
      emailVerified: json['emailVerified'] as bool? ?? false,
      requestId: json['requestId'] as String?,
      requestStatus: ApplicantRequestStatus.values.byName(
        json['requestStatus'] as String? ?? ApplicantRequestStatus.none.name,
      ),
      requestType: _decodeRequestType(json['requestType']),
      governorateId: json['governorateId'] as int?,
      districtId: json['districtId'] as int?,
      cadasterId: json['cadasterId'] as int?,
      troopId: json['troopId'] as int?,
      commissionId: json['commissionId'] as int?,
      destinationName: json['destinationName'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson(ApplicantAccessState state) => {
    'email': state.email,
    'emailVerified': state.emailVerified,
    'requestId': state.requestId,
    'requestStatus': state.requestStatus.name,
    'requestType': state.requestType?.name,
    'governorateId': state.governorateId,
    'districtId': state.districtId,
    'cadasterId': state.cadasterId,
    'troopId': state.troopId,
    'commissionId': state.commissionId,
    'destinationName': state.destinationName,
  };

  ApplicantRequestType? _decodeRequestType(Object? value) {
    if (value is! String) {
      return null;
    }

    for (final type in ApplicantRequestType.values) {
      if (type.name == value) {
        return type;
      }
    }

    return null;
  }
}
