// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_start_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApplicationStartState {

// Persisted settings
 String? get locale; ThemeMode get themeMode;// Transient application state
 bool get isLoadingLanguage; AppLaunchDestination? get launchDestination; PageStatus get pageStatus; String? get errorMessage;
/// Create a copy of ApplicationStartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationStartStateCopyWith<ApplicationStartState> get copyWith => _$ApplicationStartStateCopyWithImpl<ApplicationStartState>(this as ApplicationStartState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationStartState&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.isLoadingLanguage, isLoadingLanguage) || other.isLoadingLanguage == isLoadingLanguage)&&(identical(other.launchDestination, launchDestination) || other.launchDestination == launchDestination)&&(identical(other.pageStatus, pageStatus) || other.pageStatus == pageStatus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,locale,themeMode,isLoadingLanguage,launchDestination,pageStatus,errorMessage);

@override
String toString() {
  return 'ApplicationStartState(locale: $locale, themeMode: $themeMode, isLoadingLanguage: $isLoadingLanguage, launchDestination: $launchDestination, pageStatus: $pageStatus, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ApplicationStartStateCopyWith<$Res>  {
  factory $ApplicationStartStateCopyWith(ApplicationStartState value, $Res Function(ApplicationStartState) _then) = _$ApplicationStartStateCopyWithImpl;
@useResult
$Res call({
 String? locale, ThemeMode themeMode, bool isLoadingLanguage, AppLaunchDestination? launchDestination, PageStatus pageStatus, String? errorMessage
});




}
/// @nodoc
class _$ApplicationStartStateCopyWithImpl<$Res>
    implements $ApplicationStartStateCopyWith<$Res> {
  _$ApplicationStartStateCopyWithImpl(this._self, this._then);

  final ApplicationStartState _self;
  final $Res Function(ApplicationStartState) _then;

/// Create a copy of ApplicationStartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? locale = freezed,Object? themeMode = null,Object? isLoadingLanguage = null,Object? launchDestination = freezed,Object? pageStatus = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,isLoadingLanguage: null == isLoadingLanguage ? _self.isLoadingLanguage : isLoadingLanguage // ignore: cast_nullable_to_non_nullable
as bool,launchDestination: freezed == launchDestination ? _self.launchDestination : launchDestination // ignore: cast_nullable_to_non_nullable
as AppLaunchDestination?,pageStatus: null == pageStatus ? _self.pageStatus : pageStatus // ignore: cast_nullable_to_non_nullable
as PageStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ApplicationStartState].
extension ApplicationStartStatePatterns on ApplicationStartState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApplicationStartState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApplicationStartState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApplicationStartState value)  $default,){
final _that = this;
switch (_that) {
case _ApplicationStartState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApplicationStartState value)?  $default,){
final _that = this;
switch (_that) {
case _ApplicationStartState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? locale,  ThemeMode themeMode,  bool isLoadingLanguage,  AppLaunchDestination? launchDestination,  PageStatus pageStatus,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApplicationStartState() when $default != null:
return $default(_that.locale,_that.themeMode,_that.isLoadingLanguage,_that.launchDestination,_that.pageStatus,_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? locale,  ThemeMode themeMode,  bool isLoadingLanguage,  AppLaunchDestination? launchDestination,  PageStatus pageStatus,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ApplicationStartState():
return $default(_that.locale,_that.themeMode,_that.isLoadingLanguage,_that.launchDestination,_that.pageStatus,_that.errorMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? locale,  ThemeMode themeMode,  bool isLoadingLanguage,  AppLaunchDestination? launchDestination,  PageStatus pageStatus,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ApplicationStartState() when $default != null:
return $default(_that.locale,_that.themeMode,_that.isLoadingLanguage,_that.launchDestination,_that.pageStatus,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ApplicationStartState implements ApplicationStartState {
  const _ApplicationStartState({this.locale, this.themeMode = ThemeMode.system, this.isLoadingLanguage = false, this.launchDestination, this.pageStatus = PageStatus.initial, this.errorMessage});
  

// Persisted settings
@override final  String? locale;
@override@JsonKey() final  ThemeMode themeMode;
// Transient application state
@override@JsonKey() final  bool isLoadingLanguage;
@override final  AppLaunchDestination? launchDestination;
@override@JsonKey() final  PageStatus pageStatus;
@override final  String? errorMessage;

/// Create a copy of ApplicationStartState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplicationStartStateCopyWith<_ApplicationStartState> get copyWith => __$ApplicationStartStateCopyWithImpl<_ApplicationStartState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplicationStartState&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.isLoadingLanguage, isLoadingLanguage) || other.isLoadingLanguage == isLoadingLanguage)&&(identical(other.launchDestination, launchDestination) || other.launchDestination == launchDestination)&&(identical(other.pageStatus, pageStatus) || other.pageStatus == pageStatus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,locale,themeMode,isLoadingLanguage,launchDestination,pageStatus,errorMessage);

@override
String toString() {
  return 'ApplicationStartState(locale: $locale, themeMode: $themeMode, isLoadingLanguage: $isLoadingLanguage, launchDestination: $launchDestination, pageStatus: $pageStatus, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ApplicationStartStateCopyWith<$Res> implements $ApplicationStartStateCopyWith<$Res> {
  factory _$ApplicationStartStateCopyWith(_ApplicationStartState value, $Res Function(_ApplicationStartState) _then) = __$ApplicationStartStateCopyWithImpl;
@override @useResult
$Res call({
 String? locale, ThemeMode themeMode, bool isLoadingLanguage, AppLaunchDestination? launchDestination, PageStatus pageStatus, String? errorMessage
});




}
/// @nodoc
class __$ApplicationStartStateCopyWithImpl<$Res>
    implements _$ApplicationStartStateCopyWith<$Res> {
  __$ApplicationStartStateCopyWithImpl(this._self, this._then);

  final _ApplicationStartState _self;
  final $Res Function(_ApplicationStartState) _then;

/// Create a copy of ApplicationStartState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? locale = freezed,Object? themeMode = null,Object? isLoadingLanguage = null,Object? launchDestination = freezed,Object? pageStatus = null,Object? errorMessage = freezed,}) {
  return _then(_ApplicationStartState(
locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,isLoadingLanguage: null == isLoadingLanguage ? _self.isLoadingLanguage : isLoadingLanguage // ignore: cast_nullable_to_non_nullable
as bool,launchDestination: freezed == launchDestination ? _self.launchDestination : launchDestination // ignore: cast_nullable_to_non_nullable
as AppLaunchDestination?,pageStatus: null == pageStatus ? _self.pageStatus : pageStatus // ignore: cast_nullable_to_non_nullable
as PageStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
