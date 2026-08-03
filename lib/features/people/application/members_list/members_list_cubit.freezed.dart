// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'members_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MembersListState {

 bool get isLoading; List<Person> get members; List<Person> get visibleMembers; ScoutStage? get stage; PersonStatus? get status; MembersListError? get error;
/// Create a copy of MembersListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MembersListStateCopyWith<MembersListState> get copyWith => _$MembersListStateCopyWithImpl<MembersListState>(this as MembersListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MembersListState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.members, members)&&const DeepCollectionEquality().equals(other.visibleMembers, visibleMembers)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.status, status) || other.status == status)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(members),const DeepCollectionEquality().hash(visibleMembers),stage,status,error);

@override
String toString() {
  return 'MembersListState(isLoading: $isLoading, members: $members, visibleMembers: $visibleMembers, stage: $stage, status: $status, error: $error)';
}


}

/// @nodoc
abstract mixin class $MembersListStateCopyWith<$Res>  {
  factory $MembersListStateCopyWith(MembersListState value, $Res Function(MembersListState) _then) = _$MembersListStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<Person> members, List<Person> visibleMembers, ScoutStage? stage, PersonStatus? status, MembersListError? error
});




}
/// @nodoc
class _$MembersListStateCopyWithImpl<$Res>
    implements $MembersListStateCopyWith<$Res> {
  _$MembersListStateCopyWithImpl(this._self, this._then);

  final MembersListState _self;
  final $Res Function(MembersListState) _then;

/// Create a copy of MembersListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? members = null,Object? visibleMembers = null,Object? stage = freezed,Object? status = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<Person>,visibleMembers: null == visibleMembers ? _self.visibleMembers : visibleMembers // ignore: cast_nullable_to_non_nullable
as List<Person>,stage: freezed == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as ScoutStage?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PersonStatus?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as MembersListError?,
  ));
}

}


/// Adds pattern-matching-related methods to [MembersListState].
extension MembersListStatePatterns on MembersListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MembersListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MembersListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MembersListState value)  $default,){
final _that = this;
switch (_that) {
case _MembersListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MembersListState value)?  $default,){
final _that = this;
switch (_that) {
case _MembersListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<Person> members,  List<Person> visibleMembers,  ScoutStage? stage,  PersonStatus? status,  MembersListError? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MembersListState() when $default != null:
return $default(_that.isLoading,_that.members,_that.visibleMembers,_that.stage,_that.status,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<Person> members,  List<Person> visibleMembers,  ScoutStage? stage,  PersonStatus? status,  MembersListError? error)  $default,) {final _that = this;
switch (_that) {
case _MembersListState():
return $default(_that.isLoading,_that.members,_that.visibleMembers,_that.stage,_that.status,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<Person> members,  List<Person> visibleMembers,  ScoutStage? stage,  PersonStatus? status,  MembersListError? error)?  $default,) {final _that = this;
switch (_that) {
case _MembersListState() when $default != null:
return $default(_that.isLoading,_that.members,_that.visibleMembers,_that.stage,_that.status,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _MembersListState extends MembersListState {
  const _MembersListState({this.isLoading = false, final  List<Person> members = const <Person>[], final  List<Person> visibleMembers = const <Person>[], this.stage, this.status, this.error}): _members = members,_visibleMembers = visibleMembers,super._();
  

@override@JsonKey() final  bool isLoading;
 final  List<Person> _members;
@override@JsonKey() List<Person> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}

 final  List<Person> _visibleMembers;
@override@JsonKey() List<Person> get visibleMembers {
  if (_visibleMembers is EqualUnmodifiableListView) return _visibleMembers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_visibleMembers);
}

@override final  ScoutStage? stage;
@override final  PersonStatus? status;
@override final  MembersListError? error;

/// Create a copy of MembersListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MembersListStateCopyWith<_MembersListState> get copyWith => __$MembersListStateCopyWithImpl<_MembersListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MembersListState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._members, _members)&&const DeepCollectionEquality().equals(other._visibleMembers, _visibleMembers)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.status, status) || other.status == status)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_members),const DeepCollectionEquality().hash(_visibleMembers),stage,status,error);

@override
String toString() {
  return 'MembersListState(isLoading: $isLoading, members: $members, visibleMembers: $visibleMembers, stage: $stage, status: $status, error: $error)';
}


}

/// @nodoc
abstract mixin class _$MembersListStateCopyWith<$Res> implements $MembersListStateCopyWith<$Res> {
  factory _$MembersListStateCopyWith(_MembersListState value, $Res Function(_MembersListState) _then) = __$MembersListStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<Person> members, List<Person> visibleMembers, ScoutStage? stage, PersonStatus? status, MembersListError? error
});




}
/// @nodoc
class __$MembersListStateCopyWithImpl<$Res>
    implements _$MembersListStateCopyWith<$Res> {
  __$MembersListStateCopyWithImpl(this._self, this._then);

  final _MembersListState _self;
  final $Res Function(_MembersListState) _then;

/// Create a copy of MembersListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? members = null,Object? visibleMembers = null,Object? stage = freezed,Object? status = freezed,Object? error = freezed,}) {
  return _then(_MembersListState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<Person>,visibleMembers: null == visibleMembers ? _self._visibleMembers : visibleMembers // ignore: cast_nullable_to_non_nullable
as List<Person>,stage: freezed == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as ScoutStage?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PersonStatus?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as MembersListError?,
  ));
}


}

// dart format on
