// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'membership_requests_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MembershipRequestsState {

 bool get isLoading; bool get isSaving; List<MembershipRequest> get requests; MembershipRequestStatus? get statusFilter; MembershipRequestsError? get error;
/// Create a copy of MembershipRequestsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MembershipRequestsStateCopyWith<MembershipRequestsState> get copyWith => _$MembershipRequestsStateCopyWithImpl<MembershipRequestsState>(this as MembershipRequestsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MembershipRequestsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&const DeepCollectionEquality().equals(other.requests, requests)&&(identical(other.statusFilter, statusFilter) || other.statusFilter == statusFilter)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSaving,const DeepCollectionEquality().hash(requests),statusFilter,error);

@override
String toString() {
  return 'MembershipRequestsState(isLoading: $isLoading, isSaving: $isSaving, requests: $requests, statusFilter: $statusFilter, error: $error)';
}


}

/// @nodoc
abstract mixin class $MembershipRequestsStateCopyWith<$Res>  {
  factory $MembershipRequestsStateCopyWith(MembershipRequestsState value, $Res Function(MembershipRequestsState) _then) = _$MembershipRequestsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isSaving, List<MembershipRequest> requests, MembershipRequestStatus? statusFilter, MembershipRequestsError? error
});




}
/// @nodoc
class _$MembershipRequestsStateCopyWithImpl<$Res>
    implements $MembershipRequestsStateCopyWith<$Res> {
  _$MembershipRequestsStateCopyWithImpl(this._self, this._then);

  final MembershipRequestsState _self;
  final $Res Function(MembershipRequestsState) _then;

/// Create a copy of MembershipRequestsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isSaving = null,Object? requests = null,Object? statusFilter = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as List<MembershipRequest>,statusFilter: freezed == statusFilter ? _self.statusFilter : statusFilter // ignore: cast_nullable_to_non_nullable
as MembershipRequestStatus?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as MembershipRequestsError?,
  ));
}

}


/// Adds pattern-matching-related methods to [MembershipRequestsState].
extension MembershipRequestsStatePatterns on MembershipRequestsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MembershipRequestsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MembershipRequestsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MembershipRequestsState value)  $default,){
final _that = this;
switch (_that) {
case _MembershipRequestsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MembershipRequestsState value)?  $default,){
final _that = this;
switch (_that) {
case _MembershipRequestsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isSaving,  List<MembershipRequest> requests,  MembershipRequestStatus? statusFilter,  MembershipRequestsError? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MembershipRequestsState() when $default != null:
return $default(_that.isLoading,_that.isSaving,_that.requests,_that.statusFilter,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isSaving,  List<MembershipRequest> requests,  MembershipRequestStatus? statusFilter,  MembershipRequestsError? error)  $default,) {final _that = this;
switch (_that) {
case _MembershipRequestsState():
return $default(_that.isLoading,_that.isSaving,_that.requests,_that.statusFilter,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isSaving,  List<MembershipRequest> requests,  MembershipRequestStatus? statusFilter,  MembershipRequestsError? error)?  $default,) {final _that = this;
switch (_that) {
case _MembershipRequestsState() when $default != null:
return $default(_that.isLoading,_that.isSaving,_that.requests,_that.statusFilter,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _MembershipRequestsState extends MembershipRequestsState {
  const _MembershipRequestsState({this.isLoading = false, this.isSaving = false, final  List<MembershipRequest> requests = const <MembershipRequest>[], this.statusFilter, this.error}): _requests = requests,super._();
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSaving;
 final  List<MembershipRequest> _requests;
@override@JsonKey() List<MembershipRequest> get requests {
  if (_requests is EqualUnmodifiableListView) return _requests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requests);
}

@override final  MembershipRequestStatus? statusFilter;
@override final  MembershipRequestsError? error;

/// Create a copy of MembershipRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MembershipRequestsStateCopyWith<_MembershipRequestsState> get copyWith => __$MembershipRequestsStateCopyWithImpl<_MembershipRequestsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MembershipRequestsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&const DeepCollectionEquality().equals(other._requests, _requests)&&(identical(other.statusFilter, statusFilter) || other.statusFilter == statusFilter)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSaving,const DeepCollectionEquality().hash(_requests),statusFilter,error);

@override
String toString() {
  return 'MembershipRequestsState(isLoading: $isLoading, isSaving: $isSaving, requests: $requests, statusFilter: $statusFilter, error: $error)';
}


}

/// @nodoc
abstract mixin class _$MembershipRequestsStateCopyWith<$Res> implements $MembershipRequestsStateCopyWith<$Res> {
  factory _$MembershipRequestsStateCopyWith(_MembershipRequestsState value, $Res Function(_MembershipRequestsState) _then) = __$MembershipRequestsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isSaving, List<MembershipRequest> requests, MembershipRequestStatus? statusFilter, MembershipRequestsError? error
});




}
/// @nodoc
class __$MembershipRequestsStateCopyWithImpl<$Res>
    implements _$MembershipRequestsStateCopyWith<$Res> {
  __$MembershipRequestsStateCopyWithImpl(this._self, this._then);

  final _MembershipRequestsState _self;
  final $Res Function(_MembershipRequestsState) _then;

/// Create a copy of MembershipRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isSaving = null,Object? requests = null,Object? statusFilter = freezed,Object? error = freezed,}) {
  return _then(_MembershipRequestsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,requests: null == requests ? _self._requests : requests // ignore: cast_nullable_to_non_nullable
as List<MembershipRequest>,statusFilter: freezed == statusFilter ? _self.statusFilter : statusFilter // ignore: cast_nullable_to_non_nullable
as MembershipRequestStatus?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as MembershipRequestsError?,
  ));
}


}

// dart format on
