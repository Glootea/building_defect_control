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

String _$getProjectsHash() => r'fc750445accdd5438b2dbba4c1d1567cdc01d0f4';

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

String _$createProjectHash() => r'5be57114111a94adc534dd5682ae76c490433144';

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

@ProviderFor(testingGetProjects)
const testingGetProjectsProvider = TestingGetProjectsFamily._();

final class TestingGetProjectsProvider
    extends
        $FunctionalProvider<
          AsyncValue<GetProjectsResponse>,
          GetProjectsResponse,
          FutureOr<GetProjectsResponse>
        >
    with
        $FutureModifier<GetProjectsResponse>,
        $FutureProvider<GetProjectsResponse> {
  const TestingGetProjectsProvider._({
    required TestingGetProjectsFamily super.from,
    required (int, {String? name}) super.argument,
  }) : super(
         retry: null,
         name: r'testingGetProjectsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$testingGetProjectsHash();

  @override
  String toString() {
    return r'testingGetProjectsProvider'
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
    return testingGetProjects(ref, argument.$1, name: argument.name);
  }

  @override
  bool operator ==(Object other) {
    return other is TestingGetProjectsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$testingGetProjectsHash() =>
    r'10cde8ab21d86d5800fdf29c04e4bcd56b97d2ad';

final class TestingGetProjectsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<GetProjectsResponse>,
          (int, {String? name})
        > {
  const TestingGetProjectsFamily._()
    : super(
        retry: null,
        name: r'testingGetProjectsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TestingGetProjectsProvider call(int page, {String? name}) =>
      TestingGetProjectsProvider._(argument: (page, name: name), from: this);

  @override
  String toString() => r'testingGetProjectsProvider';
}
