// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_list_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProjectListScreen)
const projectListScreenProvider = ProjectListScreenFamily._();

final class ProjectListScreenProvider
    extends $AsyncNotifierProvider<ProjectListScreen, ProjectListPageState> {
  const ProjectListScreenProvider._({
    required ProjectListScreenFamily super.from,
    required (int, String) super.argument,
  }) : super(
         retry: null,
         name: r'projectListScreenProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$projectListScreenHash();

  @override
  String toString() {
    return r'projectListScreenProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  ProjectListScreen create() => ProjectListScreen();

  @override
  bool operator ==(Object other) {
    return other is ProjectListScreenProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectListScreenHash() => r'ad77265d17ace402f818dc3f5964d55008312b69';

final class ProjectListScreenFamily extends $Family
    with
        $ClassFamilyOverride<
          ProjectListScreen,
          AsyncValue<ProjectListPageState>,
          ProjectListPageState,
          FutureOr<ProjectListPageState>,
          (int, String)
        > {
  const ProjectListScreenFamily._()
    : super(
        retry: null,
        name: r'projectListScreenProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProjectListScreenProvider call(int page, String query) =>
      ProjectListScreenProvider._(argument: (page, query), from: this);

  @override
  String toString() => r'projectListScreenProvider';
}

abstract class _$ProjectListScreen
    extends $AsyncNotifier<ProjectListPageState> {
  late final _$args = ref.$arg as (int, String);
  int get page => _$args.$1;
  String get query => _$args.$2;

  FutureOr<ProjectListPageState> build(int page, String query);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args.$1, _$args.$2);
    final ref =
        this.ref
            as $Ref<AsyncValue<ProjectListPageState>, ProjectListPageState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ProjectListPageState>,
                ProjectListPageState
              >,
              AsyncValue<ProjectListPageState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
