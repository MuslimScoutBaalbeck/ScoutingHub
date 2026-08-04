// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'membership_request_wizard_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MembershipRequestWizardState {

 bool get isLoading; int get currentStep; int get lastStep; MembershipLocationData? get data; int? get governorateId; int? get districtId; int? get cadasterId; int? get troopId; String? get error;
/// Create a copy of MembershipRequestWizardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MembershipRequestWizardStateCopyWith<MembershipRequestWizardState> get copyWith => _$MembershipRequestWizardStateCopyWithImpl<MembershipRequestWizardState>(this as MembershipRequestWizardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MembershipRequestWizardState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.lastStep, lastStep) || other.lastStep == lastStep)&&(identical(other.data, data) || other.data == data)&&(identical(other.governorateId, governorateId) || other.governorateId == governorateId)&&(identical(other.districtId, districtId) || other.districtId == districtId)&&(identical(other.cadasterId, cadasterId) || other.cadasterId == cadasterId)&&(identical(other.troopId, troopId) || other.troopId == troopId)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,currentStep,lastStep,data,governorateId,districtId,cadasterId,troopId,error);

@override
String toString() {
  return 'MembershipRequestWizardState(isLoading: $isLoading, currentStep: $currentStep, lastStep: $lastStep, data: $data, governorateId: $governorateId, districtId: $districtId, cadasterId: $cadasterId, troopId: $troopId, error: $error)';
}


}

/// @nodoc
abstract mixin class $MembershipRequestWizardStateCopyWith<$Res>  {
  factory $MembershipRequestWizardStateCopyWith(MembershipRequestWizardState value, $Res Function(MembershipRequestWizardState) _then) = _$MembershipRequestWizardStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, int currentStep, int lastStep, MembershipLocationData? data, int? governorateId, int? districtId, int? cadasterId, int? troopId, String? error
});




}
/// @nodoc
class _$MembershipRequestWizardStateCopyWithImpl<$Res>
    implements $MembershipRequestWizardStateCopyWith<$Res> {
  _$MembershipRequestWizardStateCopyWithImpl(this._self, this._then);

  final MembershipRequestWizardState _self;
  final $Res Function(MembershipRequestWizardState) _then;

/// Create a copy of MembershipRequestWizardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? currentStep = null,Object? lastStep = null,Object? data = freezed,Object? governorateId = freezed,Object? districtId = freezed,Object? cadasterId = freezed,Object? troopId = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,lastStep: null == lastStep ? _self.lastStep : lastStep // ignore: cast_nullable_to_non_nullable
as int,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MembershipLocationData?,governorateId: freezed == governorateId ? _self.governorateId : governorateId // ignore: cast_nullable_to_non_nullable
as int?,districtId: freezed == districtId ? _self.districtId : districtId // ignore: cast_nullable_to_non_nullable
as int?,cadasterId: freezed == cadasterId ? _self.cadasterId : cadasterId // ignore: cast_nullable_to_non_nullable
as int?,troopId: freezed == troopId ? _self.troopId : troopId // ignore: cast_nullable_to_non_nullable
as int?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MembershipRequestWizardState].
extension MembershipRequestWizardStatePatterns on MembershipRequestWizardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MembershipRequestWizardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MembershipRequestWizardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MembershipRequestWizardState value)  $default,){
final _that = this;
switch (_that) {
case _MembershipRequestWizardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MembershipRequestWizardState value)?  $default,){
final _that = this;
switch (_that) {
case _MembershipRequestWizardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  int currentStep,  int lastStep,  MembershipLocationData? data,  int? governorateId,  int? districtId,  int? cadasterId,  int? troopId,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MembershipRequestWizardState() when $default != null:
return $default(_that.isLoading,_that.currentStep,_that.lastStep,_that.data,_that.governorateId,_that.districtId,_that.cadasterId,_that.troopId,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  int currentStep,  int lastStep,  MembershipLocationData? data,  int? governorateId,  int? districtId,  int? cadasterId,  int? troopId,  String? error)  $default,) {final _that = this;
switch (_that) {
case _MembershipRequestWizardState():
return $default(_that.isLoading,_that.currentStep,_that.lastStep,_that.data,_that.governorateId,_that.districtId,_that.cadasterId,_that.troopId,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  int currentStep,  int lastStep,  MembershipLocationData? data,  int? governorateId,  int? districtId,  int? cadasterId,  int? troopId,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _MembershipRequestWizardState() when $default != null:
return $default(_that.isLoading,_that.currentStep,_that.lastStep,_that.data,_that.governorateId,_that.districtId,_that.cadasterId,_that.troopId,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _MembershipRequestWizardState extends MembershipRequestWizardState {
  const _MembershipRequestWizardState({this.isLoading = false, this.currentStep = 0, this.lastStep = 3, this.data, this.governorateId, this.districtId, this.cadasterId, this.troopId, this.error}): super._();
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  int currentStep;
@override@JsonKey() final  int lastStep;
@override final  MembershipLocationData? data;
@override final  int? governorateId;
@override final  int? districtId;
@override final  int? cadasterId;
@override final  int? troopId;
@override final  String? error;

/// Create a copy of MembershipRequestWizardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MembershipRequestWizardStateCopyWith<_MembershipRequestWizardState> get copyWith => __$MembershipRequestWizardStateCopyWithImpl<_MembershipRequestWizardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MembershipRequestWizardState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.lastStep, lastStep) || other.lastStep == lastStep)&&(identical(other.data, data) || other.data == data)&&(identical(other.governorateId, governorateId) || other.governorateId == governorateId)&&(identical(other.districtId, districtId) || other.districtId == districtId)&&(identical(other.cadasterId, cadasterId) || other.cadasterId == cadasterId)&&(identical(other.troopId, troopId) || other.troopId == troopId)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,currentStep,lastStep,data,governorateId,districtId,cadasterId,troopId,error);

@override
String toString() {
  return 'MembershipRequestWizardState(isLoading: $isLoading, currentStep: $currentStep, lastStep: $lastStep, data: $data, governorateId: $governorateId, districtId: $districtId, cadasterId: $cadasterId, troopId: $troopId, error: $error)';
}


}

/// @nodoc
abstract mixin class _$MembershipRequestWizardStateCopyWith<$Res> implements $MembershipRequestWizardStateCopyWith<$Res> {
  factory _$MembershipRequestWizardStateCopyWith(_MembershipRequestWizardState value, $Res Function(_MembershipRequestWizardState) _then) = __$MembershipRequestWizardStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, int currentStep, int lastStep, MembershipLocationData? data, int? governorateId, int? districtId, int? cadasterId, int? troopId, String? error
});




}
/// @nodoc
class __$MembershipRequestWizardStateCopyWithImpl<$Res>
    implements _$MembershipRequestWizardStateCopyWith<$Res> {
  __$MembershipRequestWizardStateCopyWithImpl(this._self, this._then);

  final _MembershipRequestWizardState _self;
  final $Res Function(_MembershipRequestWizardState) _then;

/// Create a copy of MembershipRequestWizardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? currentStep = null,Object? lastStep = null,Object? data = freezed,Object? governorateId = freezed,Object? districtId = freezed,Object? cadasterId = freezed,Object? troopId = freezed,Object? error = freezed,}) {
  return _then(_MembershipRequestWizardState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,lastStep: null == lastStep ? _self.lastStep : lastStep // ignore: cast_nullable_to_non_nullable
as int,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MembershipLocationData?,governorateId: freezed == governorateId ? _self.governorateId : governorateId // ignore: cast_nullable_to_non_nullable
as int?,districtId: freezed == districtId ? _self.districtId : districtId // ignore: cast_nullable_to_non_nullable
as int?,cadasterId: freezed == cadasterId ? _self.cadasterId : cadasterId // ignore: cast_nullable_to_non_nullable
as int?,troopId: freezed == troopId ? _self.troopId : troopId // ignore: cast_nullable_to_non_nullable
as int?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
