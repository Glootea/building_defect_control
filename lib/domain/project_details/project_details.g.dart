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
    extends $AsyncNotifierProvider<ProjectDetails, ProjectShallow> {
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

String _$projectDetailsHash() => r'27664d39b1ec44614b3c4e89d249035e5d9763cb';

final class ProjectDetailsFamily extends $Family
    with
        $ClassFamilyOverride<
          ProjectDetails,
          AsyncValue<ProjectShallow>,
          ProjectShallow,
          FutureOr<ProjectShallow>,
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

  ProjectDetailsProvider call({required String projectId}) =>
      ProjectDetailsProvider._(argument: projectId, from: this);

  @override
  String toString() => r'projectDetailsProvider';
}

abstract class _$ProjectDetails extends $AsyncNotifier<ProjectShallow> {
  late final _$args = ref.$arg as String;
  String get projectId => _$args;

  FutureOr<ProjectShallow> build({required String projectId});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(projectId: _$args);
    final ref = this.ref as $Ref<AsyncValue<ProjectShallow>, ProjectShallow>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProjectShallow>, ProjectShallow>,
              AsyncValue<ProjectShallow>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
