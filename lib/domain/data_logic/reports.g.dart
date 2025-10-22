// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getReportById)
const getReportByIdProvider = GetReportByIdFamily._();

final class GetReportByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<GetReportByIdResponse>,
          GetReportByIdResponse,
          FutureOr<GetReportByIdResponse>
        >
    with
        $FutureModifier<GetReportByIdResponse>,
        $FutureProvider<GetReportByIdResponse> {
  const GetReportByIdProvider._({
    required GetReportByIdFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'getReportByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getReportByIdHash();

  @override
  String toString() {
    return r'getReportByIdProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<GetReportByIdResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<GetReportByIdResponse> create(Ref ref) {
    final argument = this.argument as (String, String);
    return getReportById(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is GetReportByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getReportByIdHash() => r'5ca69054666cf75347cef01293c390613d7806f8';

final class GetReportByIdFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<GetReportByIdResponse>,
          (String, String)
        > {
  const GetReportByIdFamily._()
    : super(
        retry: null,
        name: r'getReportByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetReportByIdProvider call(String projectId, String reportId) =>
      GetReportByIdProvider._(argument: (projectId, reportId), from: this);

  @override
  String toString() => r'getReportByIdProvider';
}

@ProviderFor(getReportsByProjectId)
const getReportsByProjectIdProvider = GetReportsByProjectIdFamily._();

final class GetReportsByProjectIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<GetReportsByProjectIdResponse>,
          GetReportsByProjectIdResponse,
          FutureOr<GetReportsByProjectIdResponse>
        >
    with
        $FutureModifier<GetReportsByProjectIdResponse>,
        $FutureProvider<GetReportsByProjectIdResponse> {
  const GetReportsByProjectIdProvider._({
    required GetReportsByProjectIdFamily super.from,
    required (String, int, {String? name}) super.argument,
  }) : super(
         retry: null,
         name: r'getReportsByProjectIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getReportsByProjectIdHash();

  @override
  String toString() {
    return r'getReportsByProjectIdProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<GetReportsByProjectIdResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<GetReportsByProjectIdResponse> create(Ref ref) {
    final argument = this.argument as (String, int, {String? name});
    return getReportsByProjectId(
      ref,
      argument.$1,
      argument.$2,
      name: argument.name,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetReportsByProjectIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getReportsByProjectIdHash() =>
    r'2ecfbad85667ceae6e33ded415b53eeb81aed58f';

final class GetReportsByProjectIdFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<GetReportsByProjectIdResponse>,
          (String, int, {String? name})
        > {
  const GetReportsByProjectIdFamily._()
    : super(
        retry: null,
        name: r'getReportsByProjectIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetReportsByProjectIdProvider call(
    String projectId,
    int page, {
    String? name,
  }) => GetReportsByProjectIdProvider._(
    argument: (projectId, page, name: name),
    from: this,
  );

  @override
  String toString() => r'getReportsByProjectIdProvider';
}

@ProviderFor(createReport)
const createReportProvider = CreateReportFamily._();

final class CreateReportProvider
    extends
        $FunctionalProvider<
          AsyncValue<CreateReportResponse>,
          CreateReportResponse,
          FutureOr<CreateReportResponse>
        >
    with
        $FutureModifier<CreateReportResponse>,
        $FutureProvider<CreateReportResponse> {
  const CreateReportProvider._({
    required CreateReportFamily super.from,
    required (String, String, String) super.argument,
  }) : super(
         retry: null,
         name: r'createReportProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$createReportHash();

  @override
  String toString() {
    return r'createReportProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<CreateReportResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CreateReportResponse> create(Ref ref) {
    final argument = this.argument as (String, String, String);
    return createReport(ref, argument.$1, argument.$2, argument.$3);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateReportProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$createReportHash() => r'6a7230dbe42288f90405dde4607579de2da6df08';

final class CreateReportFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<CreateReportResponse>,
          (String, String, String)
        > {
  const CreateReportFamily._()
    : super(
        retry: null,
        name: r'createReportProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CreateReportProvider call(
    String projectId,
    String name,
    String description,
  ) => CreateReportProvider._(
    argument: (projectId, name, description),
    from: this,
  );

  @override
  String toString() => r'createReportProvider';
}
