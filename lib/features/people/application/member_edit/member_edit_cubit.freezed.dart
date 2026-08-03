// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_edit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MemberEditState {

 bool get isSaving; Person? get updatedMember; MemberEditError? get error;
/// Create a copy of MemberEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberEditStateCopyWith<MemberEditState> get copyWith => _$MemberEditStateCopyWithImpl<MemberEditState>(this as MemberEditState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberEditState&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.updatedMember, updatedMember) || other.updatedMember == updatedMember)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isSaving,updatedMember,error);

@override
String toString() {
  return 'MemberEditState(isSaving: $isSaving, updatedMember: $updatedMember, error: $error)';
}


}

/// @nodoc
abstract mixin class $MemberEditStateCopyWith<$Res>  {
  factory $MemberEditStateCopyWith(MemberEditState value, $Res Function(MemberEditState) _then) = _$MemberEditStateCopyWithImpl;
@useResult
$Res call({
 bool isSaving, Person? updatedMember, MemberEditError? error
});




}
/// @nodoc
class _$MemberEditStateCopyWithImpl<$Res>
    implements $MemberEditStateCopyWith<$Res> {
  _$MemberEditStateCopyWithImpl(this._self, this._then);

  final MemberEditState _self;
  final $Res Function(MemberEditState) _then;

/// Create a copy of MemberEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSaving = null,Object? updatedMember = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,updatedMember: freezed == updatedMember ? _self.updatedMember : updatedMember // ignore: cast_nullable_to_non_nullable
as Person?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as MemberEditError?,
  ));
}

}


/// Adds pattern-matching-related methods to [MemberEditState].
extension MemberEditStatePatterns on MemberEditState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemberEditState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemberEditState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemberEditState value)  $default,){
final _that = this;
switch (_that) {
case _MemberEditState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemberEditState value)?  $default,){
final _that = this;
switch (_that) {
case _MemberEditState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSaving,  Person? updatedMember,  MemberEditError? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemberEditState() when $default != null:
return $default(_that.isSaving,_that.updatedMember,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSaving,  Person? updatedMember,  MemberEditError? error)  $default,) {final _that = this;
switch (_that) {
case _MemberEditState():
return $default(_that.isSaving,_that.updatedMember,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSaving,  Person? updatedMember,  MemberEditError? error)?  $default,) {final _that = this;
switch (_that) {
case _MemberEditState() when $default != null:
return $default(_that.isSaving,_that.updatedMember,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _MemberEditState implements MemberEditState {
  const _MemberEditState({this.isSaving = false, this.updatedMember, this.error});
  

@override@JsonKey() final  bool isSaving;
@override final  Person? updatedMember;
@override final  MemberEditError? error;

/// Create a copy of MemberEditState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemberEditStateCopyWith<_MemberEditState> get copyWith => __$MemberEditStateCopyWithImpl<_MemberEditState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemberEditState&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.updatedMember, updatedMember) || other.updatedMember == updatedMember)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isSaving,updatedMember,error);

@override
String toString() {
  return 'MemberEditState(isSaving: $isSaving, updatedMember: $updatedMember, error: $error)';
}


}

/// @nodoc
abstract mixin class _$MemberEditStateCopyWith<$Res> implements $MemberEditStateCopyWith<$Res> {
  factory _$MemberEditStateCopyWith(_MemberEditState value, $Res Function(_MemberEditState) _then) = __$MemberEditStateCopyWithImpl;
@override @useResult
$Res call({
 bool isSaving, Person? updatedMember, MemberEditError? error
});




}
/// @nodoc
class __$MemberEditStateCopyWithImpl<$Res>
    implements _$MemberEditStateCopyWith<$Res> {
  __$MemberEditStateCopyWithImpl(this._self, this._then);

  final _MemberEditState _self;
  final $Res Function(_MemberEditState) _then;

/// Create a copy of MemberEditState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSaving = null,Object? updatedMember = freezed,Object? error = freezed,}) {
  return _then(_MemberEditState(
isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,updatedMember: freezed == updatedMember ? _self.updatedMember : updatedMember // ignore: cast_nullable_to_non_nullable
as Person?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as MemberEditError?,
  ));
}


}

// dart format on
