// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defect_details.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DefectDetails)
const defectDetailsProvider = DefectDetailsFamily._();

final class DefectDetailsProvider
    extends $AsyncNotifierProvider<DefectDetails, Defect> {
  const DefectDetailsProvider._({
    required DefectDetailsFamily super.from,
    required ({String defectId, String reportId}) super.argument,
  }) : super(
         retry: null,
         name: r'defectDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$defectDetailsHash();

  @override
  String toString() {
    return r'defectDetailsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  DefectDetails create() => DefectDetails();

  @override
  bool operator ==(Object other) {
    return other is DefectDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$defectDetailsHash() => r'463282d9b42915c6513e0d24b934cffb7f2b7e44';

final class DefectDetailsFamily extends $Family
    with
        $ClassFamilyOverride<
          DefectDetails,
          AsyncValue<Defect>,
          Defect,
          FutureOr<Defect>,
          ({String defectId, String reportId})
        > {
  const DefectDetailsFamily._()
    : super(
        retry: null,
        name: r'defectDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DefectDetailsProvider call({
    required String defectId,
    required String reportId,
  }) => DefectDetailsProvider._(
    argument: (defectId: defectId, reportId: reportId),
    from: this,
  );

  @override
  String toString() => r'defectDetailsProvider';
}

abstract class _$DefectDetails extends $AsyncNotifier<Defect> {
  late final _$args = ref.$arg as ({String defectId, String reportId});
  String get defectId => _$args.defectId;
  String get reportId => _$args.reportId;

  FutureOr<Defect> build({required String defectId, required String reportId});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(defectId: _$args.defectId, reportId: _$args.reportId);
    final ref = this.ref as $Ref<AsyncValue<Defect>, Defect>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Defect>, Defect>,
              AsyncValue<Defect>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
