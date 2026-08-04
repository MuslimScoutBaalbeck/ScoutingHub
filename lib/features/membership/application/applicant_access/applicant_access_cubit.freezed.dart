// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'applicant_access_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApplicantAccessState {

 String? get email; bool get emailVerified; String? get requestId; ApplicantRequestStatus get requestStatus; ApplicantRequestType? get requestType; int? get governorateId; int? get districtId; int? get cadasterId; int? get troopId; int? get commissionId; String? get destinationName;
/// Create a copy of ApplicantAccessState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicantAccessStateCopyWith<ApplicantAccessState> get copyWith => _$ApplicantAccessStateCopyWithImpl<ApplicantAccessState>(this as ApplicantAccessState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicantAccessState&&(identical(other.email, email) || other.email == email)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.requestStatus, requestStatus) || other.requestStatus == requestStatus)&&(identical(other.requestType, requestType) || other.requestType == requestType)&&(identical(other.governorateId, governorateId) || other.governorateId == governorateId)&&(identical(other.districtId, districtId) || other.districtId == districtId)&&(identical(other.cadasterId, cadasterId) || other.cadasterId == cadasterId)&&(identical(other.troopId, troopId) || other.troopId == troopId)&&(identical(other.commissionId, commissionId) || other.commissionId == commissionId)&&(identical(other.destinationName, destinationName) || other.destinationName == destinationName));
}


@override
int get hashCode => Object.hash(runtimeType,email,emailVerified,requestId,requestStatus,requestType,governorateId,districtId,cadasterId,troopId,commissionId,destinationName);

@override
String toString() {
  return 'ApplicantAccessState(email: $email, emailVerified: $emailVerified, requestId: $requestId, requestStatus: $requestStatus, requestType: $requestType, governorateId: $governorateId, districtId: $districtId, cadasterId: $cadasterId, troopId: $troopId, commissionId: $commissionId, destinationName: $destinationName)';
}


}

/// @nodoc
abstract mixin class $ApplicantAccessStateCopyWith<$Res>  {
  factory $ApplicantAccessStateCopyWith(ApplicantAccessState value, $Res Function(ApplicantAccessState) _then) = _$ApplicantAccessStateCopyWithImpl;
@useResult
$Res call({
 String? email, bool emailVerified, String? requestId, ApplicantRequestStatus requestStatus, ApplicantRequestType? requestType, int? governorateId, int? districtId, int? cadasterId, int? troopId, int? commissionId, String? destinationName
});




}
/// @nodoc
class _$ApplicantAccessStateCopyWithImpl<$Res>
    implements $ApplicantAccessStateCopyWith<$Res> {
  _$ApplicantAccessStateCopyWithImpl(this._self, this._then);

  final ApplicantAccessState _self;
  final $Res Function(ApplicantAccessState) _then;

/// Create a copy of ApplicantAccessState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = freezed,Object? emailVerified = null,Object? requestId = freezed,Object? requestStatus = null,Object? requestType = freezed,Object? governorateId = freezed,Object? districtId = freezed,Object? cadasterId = freezed,Object? troopId = freezed,Object? commissionId = freezed,Object? destinationName = freezed,}) {
  return _then(_self.copyWith(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,requestStatus: null == requestStatus ? _self.requestStatus : requestStatus // ignore: cast_nullable_to_non_nullable
as ApplicantRequestStatus,requestType: freezed == requestType ? _self.requestType : requestType // ignore: cast_nullable_to_non_nullable
as ApplicantRequestType?,governorateId: freezed == governorateId ? _self.governorateId : governorateId // ignore: cast_nullable_to_non_nullable
as int?,districtId: freezed == districtId ? _self.districtId : districtId // ignore: cast_nullable_to_non_nullable
as int?,cadasterId: freezed == cadasterId ? _self.cadasterId : cadasterId // ignore: cast_nullable_to_non_nullable
as int?,troopId: freezed == troopId ? _self.troopId : troopId // ignore: cast_nullable_to_non_nullable
as int?,commissionId: freezed == commissionId ? _self.commissionId : commissionId // ignore: cast_nullable_to_non_nullable
as int?,destinationName: freezed == destinationName ? _self.destinationName : destinationName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ApplicantAccessState].
extension ApplicantAccessStatePatterns on ApplicantAccessState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApplicantAccessState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApplicantAccessState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApplicantAccessState value)  $default,){
final _that = this;
switch (_that) {
case _ApplicantAccessState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApplicantAccessState value)?  $default,){
final _that = this;
switch (_that) {
case _ApplicantAccessState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? email,  bool emailVerified,  String? requestId,  ApplicantRequestStatus requestStatus,  ApplicantRequestType? requestType,  int? governorateId,  int? districtId,  int? cadasterId,  int? troopId,  int? commissionId,  String? destinationName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApplicantAccessState() when $default != null:
return $default(_that.email,_that.emailVerified,_that.requestId,_that.requestStatus,_that.requestType,_that.governorateId,_that.districtId,_that.cadasterId,_that.troopId,_that.commissionId,_that.destinationName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? email,  bool emailVerified,  String? requestId,  ApplicantRequestStatus requestStatus,  ApplicantRequestType? requestType,  int? governorateId,  int? districtId,  int? cadasterId,  int? troopId,  int? commissionId,  String? destinationName)  $default,) {final _that = this;
switch (_that) {
case _ApplicantAccessState():
return $default(_that.email,_that.emailVerified,_that.requestId,_that.requestStatus,_that.requestType,_that.governorateId,_that.districtId,_that.cadasterId,_that.troopId,_that.commissionId,_that.destinationName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? email,  bool emailVerified,  String? requestId,  ApplicantRequestStatus requestStatus,  ApplicantRequestType? requestType,  int? governorateId,  int? districtId,  int? cadasterId,  int? troopId,  int? commissionId,  String? destinationName)?  $default,) {final _that = this;
switch (_that) {
case _ApplicantAccessState() when $default != null:
return $default(_that.email,_that.emailVerified,_that.requestId,_that.requestStatus,_that.requestType,_that.governorateId,_that.districtId,_that.cadasterId,_that.troopId,_that.commissionId,_that.destinationName);case _:
  return null;

}
}

}

/// @nodoc


class _ApplicantAccessState extends ApplicantAccessState {
  const _ApplicantAccessState({this.email, this.emailVerified = false, this.requestId, this.requestStatus = ApplicantRequestStatus.none, this.requestType, this.governorateId, this.districtId, this.cadasterId, this.troopId, this.commissionId, this.destinationName}): super._();
  

@override final  String? email;
@override@JsonKey() final  bool emailVerified;
@override final  String? requestId;
@override@JsonKey() final  ApplicantRequestStatus requestStatus;
@override final  ApplicantRequestType? requestType;
@override final  int? governorateId;
@override final  int? districtId;
@override final  int? cadasterId;
@override final  int? troopId;
@override final  int? commissionId;
@override final  String? destinationName;

/// Create a copy of ApplicantAccessState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplicantAccessStateCopyWith<_ApplicantAccessState> get copyWith => __$ApplicantAccessStateCopyWithImpl<_ApplicantAccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplicantAccessState&&(identical(other.email, email) || other.email == email)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.requestStatus, requestStatus) || other.requestStatus == requestStatus)&&(identical(other.requestType, requestType) || other.requestType == requestType)&&(identical(other.governorateId, governorateId) || other.governorateId == governorateId)&&(identical(other.districtId, districtId) || other.districtId == districtId)&&(identical(other.cadasterId, cadasterId) || other.cadasterId == cadasterId)&&(identical(other.troopId, troopId) || other.troopId == troopId)&&(identical(other.commissionId, commissionId) || other.commissionId == commissionId)&&(identical(other.destinationName, destinationName) || other.destinationName == destinationName));
}


@override
int get hashCode => Object.hash(runtimeType,email,emailVerified,requestId,requestStatus,requestType,governorateId,districtId,cadasterId,troopId,commissionId,destinationName);

@override
String toString() {
  return 'ApplicantAccessState(email: $email, emailVerified: $emailVerified, requestId: $requestId, requestStatus: $requestStatus, requestType: $requestType, governorateId: $governorateId, districtId: $districtId, cadasterId: $cadasterId, troopId: $troopId, commissionId: $commissionId, destinationName: $destinationName)';
}


}

/// @nodoc
abstract mixin class _$ApplicantAccessStateCopyWith<$Res> implements $ApplicantAccessStateCopyWith<$Res> {
  factory _$ApplicantAccessStateCopyWith(_ApplicantAccessState value, $Res Function(_ApplicantAccessState) _then) = __$ApplicantAccessStateCopyWithImpl;
@override @useResult
$Res call({
 String? email, bool emailVerified, String? requestId, ApplicantRequestStatus requestStatus, ApplicantRequestType? requestType, int? governorateId, int? districtId, int? cadasterId, int? troopId, int? commissionId, String? destinationName
});




}
/// @nodoc
class __$ApplicantAccessStateCopyWithImpl<$Res>
    implements _$ApplicantAccessStateCopyWith<$Res> {
  __$ApplicantAccessStateCopyWithImpl(this._self, this._then);

  final _ApplicantAccessState _self;
  final $Res Function(_ApplicantAccessState) _then;

/// Create a copy of ApplicantAccessState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = freezed,Object? emailVerified = null,Object? requestId = freezed,Object? requestStatus = null,Object? requestType = freezed,Object? governorateId = freezed,Object? districtId = freezed,Object? cadasterId = freezed,Object? troopId = freezed,Object? commissionId = freezed,Object? destinationName = freezed,}) {
  return _then(_ApplicantAccessState(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,requestId: freezed == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String?,requestStatus: null == requestStatus ? _self.requestStatus : requestStatus // ignore: cast_nullable_to_non_nullable
as ApplicantRequestStatus,requestType: freezed == requestType ? _self.requestType : requestType // ignore: cast_nullable_to_non_nullable
as ApplicantRequestType?,governorateId: freezed == governorateId ? _self.governorateId : governorateId // ignore: cast_nullable_to_non_nullable
as int?,districtId: freezed == districtId ? _self.districtId : districtId // ignore: cast_nullable_to_non_nullable
as int?,cadasterId: freezed == cadasterId ? _self.cadasterId : cadasterId // ignore: cast_nullable_to_non_nullable
as int?,troopId: freezed == troopId ? _self.troopId : troopId // ignore: cast_nullable_to_non_nullable
as int?,commissionId: freezed == commissionId ? _self.commissionId : commissionId // ignore: cast_nullable_to_non_nullable
as int?,destinationName: freezed == destinationName ? _self.destinationName : destinationName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
