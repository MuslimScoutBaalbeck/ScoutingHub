// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'members_dashboard_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MembersDashboardState {

 bool get isLoading; List<Person> get members; List<Person> get recentMembers; int get totalCount; int get activeCount; int get pendingCount; int get incompleteCount; MembersDashboardError? get error;
/// Create a copy of MembersDashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MembersDashboardStateCopyWith<MembersDashboardState> get copyWith => _$MembersDashboardStateCopyWithImpl<MembersDashboardState>(this as MembersDashboardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MembersDashboardState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.members, members)&&const DeepCollectionEquality().equals(other.recentMembers, recentMembers)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.activeCount, activeCount) || other.activeCount == activeCount)&&(identical(other.pendingCount, pendingCount) || other.pendingCount == pendingCount)&&(identical(other.incompleteCount, incompleteCount) || other.incompleteCount == incompleteCount)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(members),const DeepCollectionEquality().hash(recentMembers),totalCount,activeCount,pendingCount,incompleteCount,error);

@override
String toString() {
  return 'MembersDashboardState(isLoading: $isLoading, members: $members, recentMembers: $recentMembers, totalCount: $totalCount, activeCount: $activeCount, pendingCount: $pendingCount, incompleteCount: $incompleteCount, error: $error)';
}


}

/// @nodoc
abstract mixin class $MembersDashboardStateCopyWith<$Res>  {
  factory $MembersDashboardStateCopyWith(MembersDashboardState value, $Res Function(MembersDashboardState) _then) = _$MembersDashboardStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<Person> members, List<Person> recentMembers, int totalCount, int activeCount, int pendingCount, int incompleteCount, MembersDashboardError? error
});




}
/// @nodoc
class _$MembersDashboardStateCopyWithImpl<$Res>
    implements $MembersDashboardStateCopyWith<$Res> {
  _$MembersDashboardStateCopyWithImpl(this._self, this._then);

  final MembersDashboardState _self;
  final $Res Function(MembersDashboardState) _then;

/// Create a copy of MembersDashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? members = null,Object? recentMembers = null,Object? totalCount = null,Object? activeCount = null,Object? pendingCount = null,Object? incompleteCount = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<Person>,recentMembers: null == recentMembers ? _self.recentMembers : recentMembers // ignore: cast_nullable_to_non_nullable
as List<Person>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,activeCount: null == activeCount ? _self.activeCount : activeCount // ignore: cast_nullable_to_non_nullable
as int,pendingCount: null == pendingCount ? _self.pendingCount : pendingCount // ignore: cast_nullable_to_non_nullable
as int,incompleteCount: null == incompleteCount ? _self.incompleteCount : incompleteCount // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as MembersDashboardError?,
  ));
}

}


/// Adds pattern-matching-related methods to [MembersDashboardState].
extension MembersDashboardStatePatterns on MembersDashboardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MembersDashboardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MembersDashboardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MembersDashboardState value)  $default,){
final _that = this;
switch (_that) {
case _MembersDashboardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MembersDashboardState value)?  $default,){
final _that = this;
switch (_that) {
case _MembersDashboardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<Person> members,  List<Person> recentMembers,  int totalCount,  int activeCount,  int pendingCount,  int incompleteCount,  MembersDashboardError? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MembersDashboardState() when $default != null:
return $default(_that.isLoading,_that.members,_that.recentMembers,_that.totalCount,_that.activeCount,_that.pendingCount,_that.incompleteCount,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<Person> members,  List<Person> recentMembers,  int totalCount,  int activeCount,  int pendingCount,  int incompleteCount,  MembersDashboardError? error)  $default,) {final _that = this;
switch (_that) {
case _MembersDashboardState():
return $default(_that.isLoading,_that.members,_that.recentMembers,_that.totalCount,_that.activeCount,_that.pendingCount,_that.incompleteCount,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<Person> members,  List<Person> recentMembers,  int totalCount,  int activeCount,  int pendingCount,  int incompleteCount,  MembersDashboardError? error)?  $default,) {final _that = this;
switch (_that) {
case _MembersDashboardState() when $default != null:
return $default(_that.isLoading,_that.members,_that.recentMembers,_that.totalCount,_that.activeCount,_that.pendingCount,_that.incompleteCount,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _MembersDashboardState implements MembersDashboardState {
  const _MembersDashboardState({this.isLoading = false, final  List<Person> members = const <Person>[], final  List<Person> recentMembers = const <Person>[], this.totalCount = 0, this.activeCount = 0, this.pendingCount = 0, this.incompleteCount = 0, this.error}): _members = members,_recentMembers = recentMembers;
  

@override@JsonKey() final  bool isLoading;
 final  List<Person> _members;
@override@JsonKey() List<Person> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}

 final  List<Person> _recentMembers;
@override@JsonKey() List<Person> get recentMembers {
  if (_recentMembers is EqualUnmodifiableListView) return _recentMembers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentMembers);
}

@override@JsonKey() final  int totalCount;
@override@JsonKey() final  int activeCount;
@override@JsonKey() final  int pendingCount;
@override@JsonKey() final  int incompleteCount;
@override final  MembersDashboardError? error;

/// Create a copy of MembersDashboardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MembersDashboardStateCopyWith<_MembersDashboardState> get copyWith => __$MembersDashboardStateCopyWithImpl<_MembersDashboardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MembersDashboardState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._members, _members)&&const DeepCollectionEquality().equals(other._recentMembers, _recentMembers)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.activeCount, activeCount) || other.activeCount == activeCount)&&(identical(other.pendingCount, pendingCount) || other.pendingCount == pendingCount)&&(identical(other.incompleteCount, incompleteCount) || other.incompleteCount == incompleteCount)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_members),const DeepCollectionEquality().hash(_recentMembers),totalCount,activeCount,pendingCount,incompleteCount,error);

@override
String toString() {
  return 'MembersDashboardState(isLoading: $isLoading, members: $members, recentMembers: $recentMembers, totalCount: $totalCount, activeCount: $activeCount, pendingCount: $pendingCount, incompleteCount: $incompleteCount, error: $error)';
}


}

/// @nodoc
abstract mixin class _$MembersDashboardStateCopyWith<$Res> implements $MembersDashboardStateCopyWith<$Res> {
  factory _$MembersDashboardStateCopyWith(_MembersDashboardState value, $Res Function(_MembersDashboardState) _then) = __$MembersDashboardStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<Person> members, List<Person> recentMembers, int totalCount, int activeCount, int pendingCount, int incompleteCount, MembersDashboardError? error
});




}
/// @nodoc
class __$MembersDashboardStateCopyWithImpl<$Res>
    implements _$MembersDashboardStateCopyWith<$Res> {
  __$MembersDashboardStateCopyWithImpl(this._self, this._then);

  final _MembersDashboardState _self;
  final $Res Function(_MembersDashboardState) _then;

/// Create a copy of MembersDashboardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? members = null,Object? recentMembers = null,Object? totalCount = null,Object? activeCount = null,Object? pendingCount = null,Object? incompleteCount = null,Object? error = freezed,}) {
  return _then(_MembersDashboardState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<Person>,recentMembers: null == recentMembers ? _self._recentMembers : recentMembers // ignore: cast_nullable_to_non_nullable
as List<Person>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,activeCount: null == activeCount ? _self.activeCount : activeCount // ignore: cast_nullable_to_non_nullable
as int,pendingCount: null == pendingCount ? _self.pendingCount : pendingCount // ignore: cast_nullable_to_non_nullable
as int,incompleteCount: null == incompleteCount ? _self.incompleteCount : incompleteCount // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as MembersDashboardError?,
  ));
}


}

// dart format on
