// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defect_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DefectListScreen)
const defectListScreenProvider = DefectListScreenFamily._();

final class DefectListScreenProvider
    extends $AsyncNotifierProvider<DefectListScreen, DefectListPageState> {
  const DefectListScreenProvider._({
    required DefectListScreenFamily super.from,
    required ({int page, ReportListQueryState query, String reportId})
    super.argument,
  }) : super(
         retry: null,
         name: r'defectListScreenProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$defectListScreenHash();

  @override
  String toString() {
    return r'defectListScreenProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  DefectListScreen create() => DefectListScreen();

  @override
  bool operator ==(Object other) {
    return other is DefectListScreenProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$defectListScreenHash() => r'8bc752c09420dcecdfd83a94e17eec40895cd6d7';

final class DefectListScreenFamily extends $Family
    with
        $ClassFamilyOverride<
          DefectListScreen,
          AsyncValue<DefectListPageState>,
          DefectListPageState,
          FutureOr<DefectListPageState>,
          ({int page, ReportListQueryState query, String reportId})
        > {
  const DefectListScreenFamily._()
    : super(
        retry: null,
        name: r'defectListScreenProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DefectListScreenProvider call({
    required int page,
    required ReportListQueryState query,
    required String reportId,
  }) => DefectListScreenProvider._(
    argument: (page: page, query: query, reportId: reportId),
    from: this,
  );

  @override
  String toString() => r'defectListScreenProvider';
}

abstract class _$DefectListScreen extends $AsyncNotifier<DefectListPageState> {
  late final _$args =
      ref.$arg as ({int page, ReportListQueryState query, String reportId});
  int get page => _$args.page;
  ReportListQueryState get query => _$args.query;
  String get reportId => _$args.reportId;

  FutureOr<DefectListPageState> build({
    required int page,
    required ReportListQueryState query,
    required String reportId,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      page: _$args.page,
      query: _$args.query,
      reportId: _$args.reportId,
    );
    final ref =
        this.ref as $Ref<AsyncValue<DefectListPageState>, DefectListPageState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DefectListPageState>, DefectListPageState>,
              AsyncValue<DefectListPageState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
