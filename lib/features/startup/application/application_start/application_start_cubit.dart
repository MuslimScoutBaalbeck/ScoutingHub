import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:scouting_hub/core/utils/enums/launch_destination.dart';
import 'package:scouting_hub/core/utils/enums/page_status.dart';

part 'application_start_state.dart';
part 'application_start_cubit.freezed.dart';

@singleton
class ApplicationStartCubit extends HydratedCubit<ApplicationStartState> {
  ApplicationStartCubit() : super(const ApplicationStartState());

  void updateLocale(String? languageCode) {
    if (state.locale == languageCode) {
      return;
    }

    emit(state.copyWith(locale: languageCode));
  }

  void updateThemeMode(ThemeMode themeMode) {
    if (state.themeMode == themeMode) {
      return;
    }

    emit(state.copyWith(themeMode: themeMode));
  }

  void completeOnboarding() {
    if (state.onboardingCompleted) {
      return;
    }

    emit(state.copyWith(onboardingCompleted: true));
  }

  Future<void> start() async {
    emit(
      state.copyWith(
        pageStatus: PageStatus.loading,
        errorMessage: null,
        launchDestination: null,
      ),
    );

    try {
      await Future<void>.delayed(const Duration(milliseconds: 1750));

      final destination = state.onboardingCompleted
          ? AppLaunchDestination.home
          : AppLaunchDestination.setup;

      emit(
        state.copyWith(
          pageStatus: PageStatus.success,
          launchDestination: destination,
        ),
      );
    } on Exception catch (error) {
      emit(
        state.copyWith(
          pageStatus: PageStatus.failure,
          errorMessage: error.toString(),
          launchDestination: AppLaunchDestination.failure,
        ),
      );
    }
  }

  @override
  ApplicationStartState? fromJson(Map<String, dynamic> json) {
    return ApplicationStartState(
      themeMode: _decodeThemeMode(json['themeMode']),
      locale: json['locale'] as String?,
      onboardingCompleted: json['onboardingCompleted'] as bool? ?? false,
    );
  }

  @override
  Map<String, dynamic> toJson(ApplicationStartState state) {
    return <String, dynamic>{
      'themeMode': state.themeMode.name,
      'locale': state.locale,
      'onboardingCompleted': state.onboardingCompleted,
    };
  }

  ThemeMode _decodeThemeMode(Object? value) {
    if (value is String) {
      for (final themeMode in ThemeMode.values) {
        if (themeMode.name == value) {
          return themeMode;
        }
      }
    }

    if (value is int && value >= 0 && value < ThemeMode.values.length) {
      return ThemeMode.values[value];
    }

    return ThemeMode.system;
  }
}
