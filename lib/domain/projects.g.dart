// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Projects)
const projectsProvider = ProjectsProvider._();

final class ProjectsProvider
    extends $AsyncNotifierProvider<Projects, List<ProjectShallow>> {
  const ProjectsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectsHash();

  @$internal
  @override
  Projects create() => Projects();
}

String _$projectsHash() => r'6266b583842c52dbc4e4595235e3c340e4619003';

abstract class _$Projects extends $AsyncNotifier<List<ProjectShallow>> {
  FutureOr<List<ProjectShallow>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<List<ProjectShallow>>, List<ProjectShallow>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<ProjectShallow>>,
                List<ProjectShallow>
              >,
              AsyncValue<List<ProjectShallow>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
