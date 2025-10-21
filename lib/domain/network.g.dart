// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DioClient)
const dioClientProvider = DioClientProvider._();

final class DioClientProvider extends $NotifierProvider<DioClient, Dio> {
  const DioClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioClientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioClientHash();

  @$internal
  @override
  DioClient create() => DioClient();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioClientHash() => r'930807c0327785597456fe96bfded97388d316bc';

abstract class _$DioClient extends $Notifier<Dio> {
  Dio build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Dio, Dio>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Dio, Dio>,
              Dio,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
