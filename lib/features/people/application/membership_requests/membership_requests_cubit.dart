import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:scouting_hub/features/people/domain/entities/membership_request.dart';
import 'package:scouting_hub/features/people/domain/usecases/load_membership_requests_use_case.dart';
import 'package:scouting_hub/features/people/domain/usecases/save_membership_request_use_case.dart';

part 'membership_requests_cubit.freezed.dart';
part 'membership_requests_state.dart';

@injectable
final class MembershipRequestsCubit extends Cubit<MembershipRequestsState> {
  MembershipRequestsCubit(this._loadUseCase, this._saveUseCase)
      : super(const MembershipRequestsState());

  final LoadMembershipRequestsUseCase _loadUseCase;
  final SaveMembershipRequestUseCase _saveUseCase;

  Future<void> load() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final requests = await _loadUseCase();
      emit(state.copyWith(isLoading: false, requests: requests));
    } on Object {
      emit(state.copyWith(isLoading: false, error: MembershipRequestsError.unexpected));
    }
  }

  void filterBy(MembershipRequestStatus? status) {
    emit(state.copyWith(statusFilter: status));
  }

  List<MembershipRequest> search(String query) {
    final value = query.trim().toLowerCase();
    return state.visibleRequests.where((request) {
      return value.isEmpty ||
          request.fullName.toLowerCase().contains(value) ||
          request.phone.contains(value) ||
          request.id.toLowerCase().contains(value);
    }).toList(growable: false);
  }

  Future<bool> create({
    required String fullName,
    required String phone,
    required String email,
    required String address,
    required String stage,
    required String notes,
  }) async {
    final request = MembershipRequest(
      id: 'REQ-${DateTime.now().microsecondsSinceEpoch}',
      fullName: fullName.trim(),
      phone: phone.trim(),
      email: email.trim(),
      address: address.trim(),
      stage: stage.trim(),
      notes: notes.trim(),
      status: MembershipRequestStatus.submitted,
      submittedAt: DateTime.now(),
    );
    return _save(request);
  }

  Future<bool> updateStatus(
    MembershipRequest request,
    MembershipRequestStatus status,
  ) {
    return _save(request.copyWith(status: status));
  }

  Future<bool> _save(MembershipRequest request) async {
    if (state.isSaving) return false;
    emit(state.copyWith(isSaving: true, error: null));
    try {
      await _saveUseCase(request);
      await load();
      return true;
    } on Object {
      emit(state.copyWith(isSaving: false, error: MembershipRequestsError.unexpected));
      return false;
    }
  }
}
