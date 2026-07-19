part of 'application_start_cubit.dart';

@freezed
abstract class ApplicationStartState with _$ApplicationStartState {
  const factory ApplicationStartState({
    // Persisted settings
    String? locale,
    @Default(ThemeMode.system) ThemeMode themeMode,

    // Transient application state
    @Default(false) bool isLoadingLanguage,
    AppLaunchDestination? launchDestination,
    @Default(PageStatus.initial) PageStatus pageStatus,
    String? errorMessage,
  }) = _ApplicationStartState;
}
