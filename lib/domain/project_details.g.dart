// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_details.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProjectDetails)
const projectDetailsProvider = ProjectDetailsFamily._();

final class ProjectDetailsProvider
    extends $AsyncNotifierProvider<ProjectDetails, Project> {
  const ProjectDetailsProvider._({
    required ProjectDetailsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'projectDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$projectDetailsHash();

  @override
  String toString() {
    return r'projectDetailsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProjectDetails create() => ProjectDetails();

  @override
  bool operator ==(Object other) {
    return other is ProjectDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectDetailsHash() => r'89b19784d7a66f19dfba3d0900883d4abb90e8d1';

final class ProjectDetailsFamily extends $Family
    with
        $ClassFamilyOverride<
          ProjectDetails,
          AsyncValue<Project>,
          Project,
          FutureOr<Project>,
          String
        > {
  const ProjectDetailsFamily._()
    : super(
        retry: null,
        name: r'projectDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProjectDetailsProvider call(String projectId) =>
      ProjectDetailsProvider._(argument: projectId, from: this);

  @override
  String toString() => r'projectDetailsProvider';
}

abstract class _$ProjectDetails extends $AsyncNotifier<Project> {
  late final _$args = ref.$arg as String;
  String get projectId => _$args;

  FutureOr<Project> build(String projectId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<Project>, Project>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Project>, Project>,
              AsyncValue<Project>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
