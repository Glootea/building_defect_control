// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_details.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReportDetails)
const reportDetailsProvider = ReportDetailsFamily._();

final class ReportDetailsProvider
    extends $AsyncNotifierProvider<ReportDetails, Report> {
  const ReportDetailsProvider._({
    required ReportDetailsFamily super.from,
    required ({String projectId, String reportId}) super.argument,
  }) : super(
         retry: null,
         name: r'reportDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$reportDetailsHash();

  @override
  String toString() {
    return r'reportDetailsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  ReportDetails create() => ReportDetails();

  @override
  bool operator ==(Object other) {
    return other is ReportDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reportDetailsHash() => r'13c9bb9db96bc429eefbe7550ae0d10c7bf482da';

final class ReportDetailsFamily extends $Family
    with
        $ClassFamilyOverride<
          ReportDetails,
          AsyncValue<Report>,
          Report,
          FutureOr<Report>,
          ({String projectId, String reportId})
        > {
  const ReportDetailsFamily._()
    : super(
        retry: null,
        name: r'reportDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ReportDetailsProvider call({
    required String projectId,
    required String reportId,
  }) => ReportDetailsProvider._(
    argument: (projectId: projectId, reportId: reportId),
    from: this,
  );

  @override
  String toString() => r'reportDetailsProvider';
}

abstract class _$ReportDetails extends $AsyncNotifier<Report> {
  late final _$args = ref.$arg as ({String projectId, String reportId});
  String get projectId => _$args.projectId;
  String get reportId => _$args.reportId;

  FutureOr<Report> build({required String projectId, required String reportId});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      projectId: _$args.projectId,
      reportId: _$args.reportId,
    );
    final ref = this.ref as $Ref<AsyncValue<Report>, Report>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Report>, Report>,
              AsyncValue<Report>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
