// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getProjects)
const getProjectsProvider = GetProjectsFamily._();

final class GetProjectsProvider
    extends
        $FunctionalProvider<
          AsyncValue<GetProjectsResponse>,
          GetProjectsResponse,
          FutureOr<GetProjectsResponse>
        >
    with
        $FutureModifier<GetProjectsResponse>,
        $FutureProvider<GetProjectsResponse> {
  const GetProjectsProvider._({
    required GetProjectsFamily super.from,
    required (int, {String? name}) super.argument,
  }) : super(
         retry: null,
         name: r'getProjectsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getProjectsHash();

  @override
  String toString() {
    return r'getProjectsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<GetProjectsResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<GetProjectsResponse> create(Ref ref) {
    final argument = this.argument as (int, {String? name});
    return getProjects(ref, argument.$1, name: argument.name);
  }

  @override
  bool operator ==(Object other) {
    return other is GetProjectsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getProjectsHash() => r'2212ec2ffe191680ad8e0b96e0db88f6d6d2b74c';

final class GetProjectsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<GetProjectsResponse>,
          (int, {String? name})
        > {
  const GetProjectsFamily._()
    : super(
        retry: null,
        name: r'getProjectsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetProjectsProvider call(int page, {String? name}) =>
      GetProjectsProvider._(argument: (page, name: name), from: this);

  @override
  String toString() => r'getProjectsProvider';
}

@ProviderFor(createProject)
const createProjectProvider = CreateProjectFamily._();

final class CreateProjectProvider
    extends
        $FunctionalProvider<
          AsyncValue<ProjectShallow>,
          ProjectShallow,
          FutureOr<ProjectShallow>
        >
    with $FutureModifier<ProjectShallow>, $FutureProvider<ProjectShallow> {
  const CreateProjectProvider._({
    required CreateProjectFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'createProjectProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$createProjectHash();

  @override
  String toString() {
    return r'createProjectProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ProjectShallow> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ProjectShallow> create(Ref ref) {
    final argument = this.argument as String;
    return createProject(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateProjectProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$createProjectHash() => r'1d6800823399af7c738f7def9d4b0fa5b4aac870';

final class CreateProjectFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ProjectShallow>, String> {
  const CreateProjectFamily._()
    : super(
        retry: null,
        name: r'createProjectProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CreateProjectProvider call(String name) =>
      CreateProjectProvider._(argument: name, from: this);

  @override
  String toString() => r'createProjectProvider';
}

@ProviderFor(getProjectById)
const getProjectByIdProvider = GetProjectByIdFamily._();

final class GetProjectByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<ProjectShallow>,
          ProjectShallow,
          FutureOr<ProjectShallow>
        >
    with $FutureModifier<ProjectShallow>, $FutureProvider<ProjectShallow> {
  const GetProjectByIdProvider._({
    required GetProjectByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getProjectByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getProjectByIdHash();

  @override
  String toString() {
    return r'getProjectByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ProjectShallow> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ProjectShallow> create(Ref ref) {
    final argument = this.argument as String;
    return getProjectById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetProjectByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getProjectByIdHash() => r'30ae1c1c187758e1ee0f148a9dfbfbf57105654b';

final class GetProjectByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ProjectShallow>, String> {
  const GetProjectByIdFamily._()
    : super(
        retry: null,
        name: r'getProjectByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetProjectByIdProvider call(String projectId) =>
      GetProjectByIdProvider._(argument: projectId, from: this);

  @override
  String toString() => r'getProjectByIdProvider';
}
