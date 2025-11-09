// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProjectList)
const projectListProvider = ProjectListFamily._();

final class ProjectListProvider
    extends $AsyncNotifierProvider<ProjectList, ProjectListState> {
  const ProjectListProvider._({
    required ProjectListFamily super.from,
    required (int, String) super.argument,
  }) : super(
         retry: null,
         name: r'projectListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$projectListHash();

  @override
  String toString() {
    return r'projectListProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  ProjectList create() => ProjectList();

  @override
  bool operator ==(Object other) {
    return other is ProjectListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectListHash() => r'3d01b6cd4b1e5a26914769bcd6d923a02a821ac2';

final class ProjectListFamily extends $Family
    with
        $ClassFamilyOverride<
          ProjectList,
          AsyncValue<ProjectListState>,
          ProjectListState,
          FutureOr<ProjectListState>,
          (int, String)
        > {
  const ProjectListFamily._()
    : super(
        retry: null,
        name: r'projectListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProjectListProvider call(int page, String query) =>
      ProjectListProvider._(argument: (page, query), from: this);

  @override
  String toString() => r'projectListProvider';
}

abstract class _$ProjectList extends $AsyncNotifier<ProjectListState> {
  late final _$args = ref.$arg as (int, String);
  int get page => _$args.$1;
  String get query => _$args.$2;

  FutureOr<ProjectListState> build(int page, String query);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args.$1, _$args.$2);
    final ref =
        this.ref as $Ref<AsyncValue<ProjectListState>, ProjectListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProjectListState>, ProjectListState>,
              AsyncValue<ProjectListState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
