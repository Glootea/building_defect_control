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
    required String super.argument,
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
        '($argument)';
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

String _$defectDetailsHash() => r'fa35e3296d8ea0f9ea47c85c058370df4be98669';

final class DefectDetailsFamily extends $Family
    with
        $ClassFamilyOverride<
          DefectDetails,
          AsyncValue<Defect>,
          Defect,
          FutureOr<Defect>,
          String
        > {
  const DefectDetailsFamily._()
    : super(
        retry: null,
        name: r'defectDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DefectDetailsProvider call(String defectId) =>
      DefectDetailsProvider._(argument: defectId, from: this);

  @override
  String toString() => r'defectDetailsProvider';
}

abstract class _$DefectDetails extends $AsyncNotifier<Defect> {
  late final _$args = ref.$arg as String;
  String get defectId => _$args;

  FutureOr<Defect> build(String defectId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
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
