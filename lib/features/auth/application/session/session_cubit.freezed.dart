// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SessionState {

 bool get isLoading; AuthSession? get session; int? get activeAssignmentId; SessionError? get error;
/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionStateCopyWith<SessionState> get copyWith => _$SessionStateCopyWithImpl<SessionState>(this as SessionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.session, session) || other.session == session)&&(identical(other.activeAssignmentId, activeAssignmentId) || other.activeAssignmentId == activeAssignmentId)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,session,activeAssignmentId,error);

@override
String toString() {
  return 'SessionState(isLoading: $isLoading, session: $session, activeAssignmentId: $activeAssignmentId, error: $error)';
}


}

/// @nodoc
abstract mixin class $SessionStateCopyWith<$Res>  {
  factory $SessionStateCopyWith(SessionState value, $Res Function(SessionState) _then) = _$SessionStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, AuthSession? session, int? activeAssignmentId, SessionError? error
});




}
/// @nodoc
class _$SessionStateCopyWithImpl<$Res>
    implements $SessionStateCopyWith<$Res> {
  _$SessionStateCopyWithImpl(this._self, this._then);

  final SessionState _self;
  final $Res Function(SessionState) _then;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? session = freezed,Object? activeAssignmentId = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as AuthSession?,activeAssignmentId: freezed == activeAssignmentId ? _self.activeAssignmentId : activeAssignmentId // ignore: cast_nullable_to_non_nullable
as int?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as SessionError?,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionState].
extension SessionStatePatterns on SessionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionState value)  $default,){
final _that = this;
switch (_that) {
case _SessionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionState value)?  $default,){
final _that = this;
switch (_that) {
case _SessionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  AuthSession? session,  int? activeAssignmentId,  SessionError? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionState() when $default != null:
return $default(_that.isLoading,_that.session,_that.activeAssignmentId,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  AuthSession? session,  int? activeAssignmentId,  SessionError? error)  $default,) {final _that = this;
switch (_that) {
case _SessionState():
return $default(_that.isLoading,_that.session,_that.activeAssignmentId,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  AuthSession? session,  int? activeAssignmentId,  SessionError? error)?  $default,) {final _that = this;
switch (_that) {
case _SessionState() when $default != null:
return $default(_that.isLoading,_that.session,_that.activeAssignmentId,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _SessionState extends SessionState {
  const _SessionState({this.isLoading = false, this.session, this.activeAssignmentId, this.error}): super._();
  

@override@JsonKey() final  bool isLoading;
@override final  AuthSession? session;
@override final  int? activeAssignmentId;
@override final  SessionError? error;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionStateCopyWith<_SessionState> get copyWith => __$SessionStateCopyWithImpl<_SessionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.session, session) || other.session == session)&&(identical(other.activeAssignmentId, activeAssignmentId) || other.activeAssignmentId == activeAssignmentId)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,session,activeAssignmentId,error);

@override
String toString() {
  return 'SessionState(isLoading: $isLoading, session: $session, activeAssignmentId: $activeAssignmentId, error: $error)';
}


}

/// @nodoc
abstract mixin class _$SessionStateCopyWith<$Res> implements $SessionStateCopyWith<$Res> {
  factory _$SessionStateCopyWith(_SessionState value, $Res Function(_SessionState) _then) = __$SessionStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, AuthSession? session, int? activeAssignmentId, SessionError? error
});




}
/// @nodoc
class __$SessionStateCopyWithImpl<$Res>
    implements _$SessionStateCopyWith<$Res> {
  __$SessionStateCopyWithImpl(this._self, this._then);

  final _SessionState _self;
  final $Res Function(_SessionState) _then;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? session = freezed,Object? activeAssignmentId = freezed,Object? error = freezed,}) {
  return _then(_SessionState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as AuthSession?,activeAssignmentId: freezed == activeAssignmentId ? _self.activeAssignmentId : activeAssignmentId // ignore: cast_nullable_to_non_nullable
as int?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as SessionError?,
  ));
}


}

// dart format on
