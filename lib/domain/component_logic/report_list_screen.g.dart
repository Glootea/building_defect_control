// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_list_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReportListScreen)
const reportListScreenProvider = ReportListScreenFamily._();

final class ReportListScreenProvider
    extends $AsyncNotifierProvider<ReportListScreen, ReportListPageState> {
  const ReportListScreenProvider._({
    required ReportListScreenFamily super.from,
    required (String, int, String) super.argument,
  }) : super(
         retry: null,
         name: r'reportListScreenProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$reportListScreenHash();

  @override
  String toString() {
    return r'reportListScreenProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  ReportListScreen create() => ReportListScreen();

  @override
  bool operator ==(Object other) {
    return other is ReportListScreenProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reportListScreenHash() => r'6f29094c7fa3b3b7392d27b6fed32cca5666a56f';

final class ReportListScreenFamily extends $Family
    with
        $ClassFamilyOverride<
          ReportListScreen,
          AsyncValue<ReportListPageState>,
          ReportListPageState,
          FutureOr<ReportListPageState>,
          (String, int, String)
        > {
  const ReportListScreenFamily._()
    : super(
        retry: null,
        name: r'reportListScreenProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ReportListScreenProvider call(String projectId, int page, String query) =>
      ReportListScreenProvider._(
        argument: (projectId, page, query),
        from: this,
      );

  @override
  String toString() => r'reportListScreenProvider';
}

abstract class _$ReportListScreen extends $AsyncNotifier<ReportListPageState> {
  late final _$args = ref.$arg as (String, int, String);
  String get projectId => _$args.$1;
  int get page => _$args.$2;
  String get query => _$args.$3;

  FutureOr<ReportListPageState> build(String projectId, int page, String query);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args.$1, _$args.$2, _$args.$3);
    final ref =
        this.ref as $Ref<AsyncValue<ReportListPageState>, ReportListPageState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ReportListPageState>, ReportListPageState>,
              AsyncValue<ReportListPageState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
