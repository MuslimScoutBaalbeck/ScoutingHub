// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_create_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MemberCreateState {

 int get currentStep; ScoutStage get stage; PersonStatus get status; bool get isSaving; bool get isSaved; MemberCreateError? get error;
/// Create a copy of MemberCreateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberCreateStateCopyWith<MemberCreateState> get copyWith => _$MemberCreateStateCopyWithImpl<MemberCreateState>(this as MemberCreateState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberCreateState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.status, status) || other.status == status)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,stage,status,isSaving,isSaved,error);

@override
String toString() {
  return 'MemberCreateState(currentStep: $currentStep, stage: $stage, status: $status, isSaving: $isSaving, isSaved: $isSaved, error: $error)';
}


}

/// @nodoc
abstract mixin class $MemberCreateStateCopyWith<$Res>  {
  factory $MemberCreateStateCopyWith(MemberCreateState value, $Res Function(MemberCreateState) _then) = _$MemberCreateStateCopyWithImpl;
@useResult
$Res call({
 int currentStep, ScoutStage stage, PersonStatus status, bool isSaving, bool isSaved, MemberCreateError? error
});




}
/// @nodoc
class _$MemberCreateStateCopyWithImpl<$Res>
    implements $MemberCreateStateCopyWith<$Res> {
  _$MemberCreateStateCopyWithImpl(this._self, this._then);

  final MemberCreateState _self;
  final $Res Function(MemberCreateState) _then;

/// Create a copy of MemberCreateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStep = null,Object? stage = null,Object? status = null,Object? isSaving = null,Object? isSaved = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as ScoutStage,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PersonStatus,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as MemberCreateError?,
  ));
}

}


/// Adds pattern-matching-related methods to [MemberCreateState].
extension MemberCreateStatePatterns on MemberCreateState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemberCreateState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemberCreateState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemberCreateState value)  $default,){
final _that = this;
switch (_that) {
case _MemberCreateState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemberCreateState value)?  $default,){
final _that = this;
switch (_that) {
case _MemberCreateState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentStep,  ScoutStage stage,  PersonStatus status,  bool isSaving,  bool isSaved,  MemberCreateError? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemberCreateState() when $default != null:
return $default(_that.currentStep,_that.stage,_that.status,_that.isSaving,_that.isSaved,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentStep,  ScoutStage stage,  PersonStatus status,  bool isSaving,  bool isSaved,  MemberCreateError? error)  $default,) {final _that = this;
switch (_that) {
case _MemberCreateState():
return $default(_that.currentStep,_that.stage,_that.status,_that.isSaving,_that.isSaved,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentStep,  ScoutStage stage,  PersonStatus status,  bool isSaving,  bool isSaved,  MemberCreateError? error)?  $default,) {final _that = this;
switch (_that) {
case _MemberCreateState() when $default != null:
return $default(_that.currentStep,_that.stage,_that.status,_that.isSaving,_that.isSaved,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _MemberCreateState implements MemberCreateState {
  const _MemberCreateState({this.currentStep = 0, this.stage = ScoutStage.scout, this.status = PersonStatus.pending, this.isSaving = false, this.isSaved = false, this.error});
  

@override@JsonKey() final  int currentStep;
@override@JsonKey() final  ScoutStage stage;
@override@JsonKey() final  PersonStatus status;
@override@JsonKey() final  bool isSaving;
@override@JsonKey() final  bool isSaved;
@override final  MemberCreateError? error;

/// Create a copy of MemberCreateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemberCreateStateCopyWith<_MemberCreateState> get copyWith => __$MemberCreateStateCopyWithImpl<_MemberCreateState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemberCreateState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.status, status) || other.status == status)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,stage,status,isSaving,isSaved,error);

@override
String toString() {
  return 'MemberCreateState(currentStep: $currentStep, stage: $stage, status: $status, isSaving: $isSaving, isSaved: $isSaved, error: $error)';
}


}

/// @nodoc
abstract mixin class _$MemberCreateStateCopyWith<$Res> implements $MemberCreateStateCopyWith<$Res> {
  factory _$MemberCreateStateCopyWith(_MemberCreateState value, $Res Function(_MemberCreateState) _then) = __$MemberCreateStateCopyWithImpl;
@override @useResult
$Res call({
 int currentStep, ScoutStage stage, PersonStatus status, bool isSaving, bool isSaved, MemberCreateError? error
});




}
/// @nodoc
class __$MemberCreateStateCopyWithImpl<$Res>
    implements _$MemberCreateStateCopyWith<$Res> {
  __$MemberCreateStateCopyWithImpl(this._self, this._then);

  final _MemberCreateState _self;
  final $Res Function(_MemberCreateState) _then;

/// Create a copy of MemberCreateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStep = null,Object? stage = null,Object? status = null,Object? isSaving = null,Object? isSaved = null,Object? error = freezed,}) {
  return _then(_MemberCreateState(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as ScoutStage,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PersonStatus,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as MemberCreateError?,
  ));
}


}

// dart format on
