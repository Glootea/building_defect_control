// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defect_elimination.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DefectEliminationProvider)
const defectEliminationProviderProvider = DefectEliminationProviderFamily._();

final class DefectEliminationProviderProvider
    extends
        $AsyncNotifierProvider<
          DefectEliminationProvider,
          models.DefectElimination?
        > {
  const DefectEliminationProviderProvider._({
    required DefectEliminationProviderFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'defectEliminationProviderProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$defectEliminationProviderHash();

  @override
  String toString() {
    return r'defectEliminationProviderProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DefectEliminationProvider create() => DefectEliminationProvider();

  @override
  bool operator ==(Object other) {
    return other is DefectEliminationProviderProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$defectEliminationProviderHash() =>
    r'3139a5586d42f14d61d353a6be2aac53dc0dbfc1';

final class DefectEliminationProviderFamily extends $Family
    with
        $ClassFamilyOverride<
          DefectEliminationProvider,
          AsyncValue<models.DefectElimination?>,
          models.DefectElimination?,
          FutureOr<models.DefectElimination?>,
          String
        > {
  const DefectEliminationProviderFamily._()
    : super(
        retry: null,
        name: r'defectEliminationProviderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DefectEliminationProviderProvider call(String defectId) =>
      DefectEliminationProviderProvider._(argument: defectId, from: this);

  @override
  String toString() => r'defectEliminationProviderProvider';
}

abstract class _$DefectEliminationProvider
    extends $AsyncNotifier<models.DefectElimination?> {
  late final _$args = ref.$arg as String;
  String get defectId => _$args;

  FutureOr<models.DefectElimination?> build(String defectId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<
              AsyncValue<models.DefectElimination?>,
              models.DefectElimination?
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<models.DefectElimination?>,
                models.DefectElimination?
              >,
              AsyncValue<models.DefectElimination?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
