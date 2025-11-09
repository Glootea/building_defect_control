// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defect_elimination.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DefectElimination)
const defectEliminationProvider = DefectEliminationFamily._();

final class DefectEliminationProvider
    extends
        $AsyncNotifierProvider<DefectElimination, models.DefectElimination?> {
  const DefectEliminationProvider._({
    required DefectEliminationFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'defectEliminationProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$defectEliminationHash();

  @override
  String toString() {
    return r'defectEliminationProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DefectElimination create() => DefectElimination();

  @override
  bool operator ==(Object other) {
    return other is DefectEliminationProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$defectEliminationHash() => r'2ac3df59b70d0cdaad0a892465d79934e5ed24fc';

final class DefectEliminationFamily extends $Family
    with
        $ClassFamilyOverride<
          DefectElimination,
          AsyncValue<models.DefectElimination?>,
          models.DefectElimination?,
          FutureOr<models.DefectElimination?>,
          String
        > {
  const DefectEliminationFamily._()
    : super(
        retry: null,
        name: r'defectEliminationProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DefectEliminationProvider call(String defectId) =>
      DefectEliminationProvider._(argument: defectId, from: this);

  @override
  String toString() => r'defectEliminationProvider';
}

abstract class _$DefectElimination
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
