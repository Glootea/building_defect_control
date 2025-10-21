// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_list_screen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectListPageState {

 List<ProjectShallow> get projects; String get searchQuery; PaginatedMetadata get metadata;
/// Create a copy of ProjectListPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectListPageStateCopyWith<ProjectListPageState> get copyWith => _$ProjectListPageStateCopyWithImpl<ProjectListPageState>(this as ProjectListPageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectListPageState&&const DeepCollectionEquality().equals(other.projects, projects)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(projects),searchQuery,metadata);

@override
String toString() {
  return 'ProjectListPageState(projects: $projects, searchQuery: $searchQuery, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $ProjectListPageStateCopyWith<$Res>  {
  factory $ProjectListPageStateCopyWith(ProjectListPageState value, $Res Function(ProjectListPageState) _then) = _$ProjectListPageStateCopyWithImpl;
@useResult
$Res call({
 List<ProjectShallow> projects, String searchQuery, PaginatedMetadata metadata
});




}
/// @nodoc
class _$ProjectListPageStateCopyWithImpl<$Res>
    implements $ProjectListPageStateCopyWith<$Res> {
  _$ProjectListPageStateCopyWithImpl(this._self, this._then);

  final ProjectListPageState _self;
  final $Res Function(ProjectListPageState) _then;

/// Create a copy of ProjectListPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projects = null,Object? searchQuery = null,Object? metadata = null,}) {
  return _then(ProjectListPageState(
projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as List<ProjectShallow>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as PaginatedMetadata,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectListPageState].
extension ProjectListPageStatePatterns on ProjectListPageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

// dart format on
