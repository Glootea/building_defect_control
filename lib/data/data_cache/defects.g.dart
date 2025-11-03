// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defects.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getDefects)
const getDefectsProvider = GetDefectsFamily._();

final class GetDefectsProvider
    extends
        $FunctionalProvider<
          AsyncValue<GetDefectsByReportIdResponse>,
          GetDefectsByReportIdResponse,
          FutureOr<GetDefectsByReportIdResponse>
        >
    with
        $FutureModifier<GetDefectsByReportIdResponse>,
        $FutureProvider<GetDefectsByReportIdResponse> {
  const GetDefectsProvider._({
    required GetDefectsFamily super.from,
    required (int, {String reportId, String? name}) super.argument,
  }) : super(
         retry: null,
         name: r'getDefectsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getDefectsHash();

  @override
  String toString() {
    return r'getDefectsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<GetDefectsByReportIdResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<GetDefectsByReportIdResponse> create(Ref ref) {
    final argument = this.argument as (int, {String reportId, String? name});
    return getDefects(
      ref,
      argument.$1,
      reportId: argument.reportId,
      name: argument.name,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetDefectsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getDefectsHash() => r'b2dfdd6811a0962269d952279d5e73d8b7337161';

final class GetDefectsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<GetDefectsByReportIdResponse>,
          (int, {String reportId, String? name})
        > {
  const GetDefectsFamily._()
    : super(
        retry: null,
        name: r'getDefectsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetDefectsProvider call(int page, {required String reportId, String? name}) =>
      GetDefectsProvider._(
        argument: (page, reportId: reportId, name: name),
        from: this,
      );

  @override
  String toString() => r'getDefectsProvider';
}

@ProviderFor(createDefect)
const createDefectProvider = CreateDefectFamily._();

final class CreateDefectProvider
    extends
        $FunctionalProvider<
          AsyncValue<CreateDefectResponse>,
          CreateDefectResponse,
          FutureOr<CreateDefectResponse>
        >
    with
        $FutureModifier<CreateDefectResponse>,
        $FutureProvider<CreateDefectResponse> {
  const CreateDefectProvider._({
    required CreateDefectFamily super.from,
    required ({
      String reportId,
      String name,
      String description,
      String classification,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'createDefectProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$createDefectHash();

  @override
  String toString() {
    return r'createDefectProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<CreateDefectResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CreateDefectResponse> create(Ref ref) {
    final argument =
        this.argument
            as ({
              String reportId,
              String name,
              String description,
              String classification,
            });
    return createDefect(
      ref,
      reportId: argument.reportId,
      name: argument.name,
      description: argument.description,
      classification: argument.classification,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CreateDefectProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$createDefectHash() => r'b3f1efe0a943ec084dc5adc9d931f8b53c2666e8';

final class CreateDefectFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<CreateDefectResponse>,
          ({
            String reportId,
            String name,
            String description,
            String classification,
          })
        > {
  const CreateDefectFamily._()
    : super(
        retry: null,
        name: r'createDefectProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CreateDefectProvider call({
    required String reportId,
    required String name,
    required String description,
    required String classification,
  }) => CreateDefectProvider._(
    argument: (
      reportId: reportId,
      name: name,
      description: description,
      classification: classification,
    ),
    from: this,
  );

  @override
  String toString() => r'createDefectProvider';
}

@ProviderFor(getDefectById)
const getDefectByIdProvider = GetDefectByIdFamily._();

final class GetDefectByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<GetDefectByIdResponse>,
          GetDefectByIdResponse,
          FutureOr<GetDefectByIdResponse>
        >
    with
        $FutureModifier<GetDefectByIdResponse>,
        $FutureProvider<GetDefectByIdResponse> {
  const GetDefectByIdProvider._({
    required GetDefectByIdFamily super.from,
    required ({String reportId, String defectId}) super.argument,
  }) : super(
         retry: null,
         name: r'getDefectByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getDefectByIdHash();

  @override
  String toString() {
    return r'getDefectByIdProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<GetDefectByIdResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<GetDefectByIdResponse> create(Ref ref) {
    final argument = this.argument as ({String reportId, String defectId});
    return getDefectById(
      ref,
      reportId: argument.reportId,
      defectId: argument.defectId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetDefectByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getDefectByIdHash() => r'1d22a996cc44ba5163553bf0ba2cac1807e2134b';

final class GetDefectByIdFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<GetDefectByIdResponse>,
          ({String reportId, String defectId})
        > {
  const GetDefectByIdFamily._()
    : super(
        retry: null,
        name: r'getDefectByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetDefectByIdProvider call({
    required String reportId,
    required String defectId,
  }) => GetDefectByIdProvider._(
    argument: (reportId: reportId, defectId: defectId),
    from: this,
  );

  @override
  String toString() => r'getDefectByIdProvider';
}
