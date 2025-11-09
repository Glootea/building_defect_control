// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defect_attachment_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DefectAttachmentList)
const defectAttachmentListProvider = DefectAttachmentListFamily._();

final class DefectAttachmentListProvider
    extends
        $AsyncNotifierProvider<
          DefectAttachmentList,
          DefectAttachmentListState
        > {
  const DefectAttachmentListProvider._({
    required DefectAttachmentListFamily super.from,
    required ({int page, DefectAttachmentListQuery query, String defectId})
    super.argument,
  }) : super(
         retry: null,
         name: r'defectAttachmentListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$defectAttachmentListHash();

  @override
  String toString() {
    return r'defectAttachmentListProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  DefectAttachmentList create() => DefectAttachmentList();

  @override
  bool operator ==(Object other) {
    return other is DefectAttachmentListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$defectAttachmentListHash() =>
    r'd3921373147045bf9e2921ddb928aa16582874f3';

final class DefectAttachmentListFamily extends $Family
    with
        $ClassFamilyOverride<
          DefectAttachmentList,
          AsyncValue<DefectAttachmentListState>,
          DefectAttachmentListState,
          FutureOr<DefectAttachmentListState>,
          ({int page, DefectAttachmentListQuery query, String defectId})
        > {
  const DefectAttachmentListFamily._()
    : super(
        retry: null,
        name: r'defectAttachmentListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DefectAttachmentListProvider call({
    required int page,
    required DefectAttachmentListQuery query,
    required String defectId,
  }) => DefectAttachmentListProvider._(
    argument: (page: page, query: query, defectId: defectId),
    from: this,
  );

  @override
  String toString() => r'defectAttachmentListProvider';
}

abstract class _$DefectAttachmentList
    extends $AsyncNotifier<DefectAttachmentListState> {
  late final _$args =
      ref.$arg
          as ({int page, DefectAttachmentListQuery query, String defectId});
  int get page => _$args.page;
  DefectAttachmentListQuery get query => _$args.query;
  String get defectId => _$args.defectId;

  FutureOr<DefectAttachmentListState> build({
    required int page,
    required DefectAttachmentListQuery query,
    required String defectId,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      page: _$args.page,
      query: _$args.query,
      defectId: _$args.defectId,
    );
    final ref =
        this.ref
            as $Ref<
              AsyncValue<DefectAttachmentListState>,
              DefectAttachmentListState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<DefectAttachmentListState>,
                DefectAttachmentListState
              >,
              AsyncValue<DefectAttachmentListState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
