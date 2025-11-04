// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReportList)
const reportListProvider = ReportListFamily._();

final class ReportListProvider
    extends $AsyncNotifierProvider<ReportList, ReportListState> {
  const ReportListProvider._({
    required ReportListFamily super.from,
    required (String, int, String) super.argument,
  }) : super(
         retry: null,
         name: r'reportListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$reportListHash();

  @override
  String toString() {
    return r'reportListProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  ReportList create() => ReportList();

  @override
  bool operator ==(Object other) {
    return other is ReportListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reportListHash() => r'fdee5f02222fb01c3e3ae4bc0b341c62d1d45e90';

final class ReportListFamily extends $Family
    with
        $ClassFamilyOverride<
          ReportList,
          AsyncValue<ReportListState>,
          ReportListState,
          FutureOr<ReportListState>,
          (String, int, String)
        > {
  const ReportListFamily._()
    : super(
        retry: null,
        name: r'reportListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ReportListProvider call(String projectId, int page, String query) =>
      ReportListProvider._(argument: (projectId, page, query), from: this);

  @override
  String toString() => r'reportListProvider';
}

abstract class _$ReportList extends $AsyncNotifier<ReportListState> {
  late final _$args = ref.$arg as (String, int, String);
  String get projectId => _$args.$1;
  int get page => _$args.$2;
  String get query => _$args.$3;

  FutureOr<ReportListState> build(String projectId, int page, String query);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args.$1, _$args.$2, _$args.$3);
    final ref = this.ref as $Ref<AsyncValue<ReportListState>, ReportListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ReportListState>, ReportListState>,
              AsyncValue<ReportListState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
