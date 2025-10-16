// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'di.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dataProvider)
const dataProviderProvider = DataProviderProvider._();

final class DataProviderProvider
    extends $FunctionalProvider<IDataProvider, IDataProvider, IDataProvider>
    with $Provider<IDataProvider> {
  const DataProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dataProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dataProviderHash();

  @$internal
  @override
  $ProviderElement<IDataProvider> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IDataProvider create(Ref ref) {
    return dataProvider(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IDataProvider value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IDataProvider>(value),
    );
  }
}

String _$dataProviderHash() => r'771adfc5d4947b4452a4d39a43cbaff028601473';

@ProviderFor(testingDataProvider)
const testingDataProviderProvider = TestingDataProviderProvider._();

final class TestingDataProviderProvider
    extends $FunctionalProvider<IDataProvider, IDataProvider, IDataProvider>
    with $Provider<IDataProvider> {
  const TestingDataProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'testingDataProviderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$testingDataProviderHash();

  @$internal
  @override
  $ProviderElement<IDataProvider> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IDataProvider create(Ref ref) {
    return testingDataProvider(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IDataProvider value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IDataProvider>(value),
    );
  }
}

String _$testingDataProviderHash() =>
    r'0656d6853de43f3f86635d1581c3def1cf6c63bd';

@ProviderFor(userDataProvider)
const userDataProviderProvider = UserDataProviderProvider._();

final class UserDataProviderProvider
    extends
        $FunctionalProvider<
          IUserDataProvider,
          IUserDataProvider,
          IUserDataProvider
        >
    with $Provider<IUserDataProvider> {
  const UserDataProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userDataProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userDataProviderHash();

  @$internal
  @override
  $ProviderElement<IUserDataProvider> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IUserDataProvider create(Ref ref) {
    return userDataProvider(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IUserDataProvider value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IUserDataProvider>(value),
    );
  }
}

String _$userDataProviderHash() => r'627958d3f14dad60ba477f9fcd4b2b12d826a9de';

@ProviderFor(testingUserDataProvider)
const testingUserDataProviderProvider = TestingUserDataProviderProvider._();

final class TestingUserDataProviderProvider
    extends
        $FunctionalProvider<
          IUserDataProvider,
          IUserDataProvider,
          IUserDataProvider
        >
    with $Provider<IUserDataProvider> {
  const TestingUserDataProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'testingUserDataProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$testingUserDataProviderHash();

  @$internal
  @override
  $ProviderElement<IUserDataProvider> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IUserDataProvider create(Ref ref) {
    return testingUserDataProvider(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IUserDataProvider value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IUserDataProvider>(value),
    );
  }
}

String _$testingUserDataProviderHash() =>
    r'c4b422dfee9540671e1b562e050589eb40bf4c45';

@ProviderFor(uuid)
const uuidProvider = UuidProvider._();

final class UuidProvider extends $FunctionalProvider<Uuid, Uuid, Uuid>
    with $Provider<Uuid> {
  const UuidProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'uuidProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$uuidHash();

  @$internal
  @override
  $ProviderElement<Uuid> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Uuid create(Ref ref) {
    return uuid(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Uuid value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Uuid>(value),
    );
  }
}

String _$uuidHash() => r'bb47844b57b43df0119323b586f312fabcc6d8aa';

@ProviderFor(secureStorage)
const secureStorageProvider = SecureStorageProvider._();

final class SecureStorageProvider
    extends
        $FunctionalProvider<
          FlutterSecureStorage,
          FlutterSecureStorage,
          FlutterSecureStorage
        >
    with $Provider<FlutterSecureStorage> {
  const SecureStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'secureStorageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$secureStorageHash();

  @$internal
  @override
  $ProviderElement<FlutterSecureStorage> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FlutterSecureStorage create(Ref ref) {
    return secureStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FlutterSecureStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FlutterSecureStorage>(value),
    );
  }
}

String _$secureStorageHash() => r'273dc403a965c1f24962aaf4d40776611a26f8b8';

@ProviderFor(userCache)
const userCacheProvider = UserCacheProvider._();

final class UserCacheProvider
    extends $FunctionalProvider<UserCache, UserCache, UserCache>
    with $Provider<UserCache> {
  const UserCacheProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userCacheProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userCacheHash();

  @$internal
  @override
  $ProviderElement<UserCache> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserCache create(Ref ref) {
    return userCache(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserCache value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserCache>(value),
    );
  }
}

String _$userCacheHash() => r'abeda657eb27f5a05821cfd1eedbe4d2658877f0';
