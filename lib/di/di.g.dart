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

String _$dataProviderHash() => r'6f13da1349ba0ea24613af7801b4986d44049fa5';

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

@ProviderFor(authService)
const authServiceProvider = AuthServiceProvider._();

final class AuthServiceProvider
    extends $FunctionalProvider<IAuthService, IAuthService, IAuthService>
    with $Provider<IAuthService> {
  const AuthServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authServiceHash();

  @$internal
  @override
  $ProviderElement<IAuthService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IAuthService create(Ref ref) {
    return authService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IAuthService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IAuthService>(value),
    );
  }
}

String _$authServiceHash() => r'a09508be360111cbaf0e9366783038289e37f375';

@ProviderFor(testingAuthService)
const testingAuthServiceProvider = TestingAuthServiceProvider._();

final class TestingAuthServiceProvider
    extends $FunctionalProvider<IAuthService, IAuthService, IAuthService>
    with $Provider<IAuthService> {
  const TestingAuthServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'testingAuthServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$testingAuthServiceHash();

  @$internal
  @override
  $ProviderElement<IAuthService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IAuthService create(Ref ref) {
    return testingAuthService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IAuthService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IAuthService>(value),
    );
  }
}

String _$testingAuthServiceHash() =>
    r'd233aad7ef48edf916c2ceb5705bde5624f6d7db';

@ProviderFor(getDio)
const getDioProvider = GetDioProvider._();

final class GetDioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  const GetDioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getDioProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getDioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return getDio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$getDioHash() => r'c81d549104eff4924af44b6bc7045f14b58d144a';

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

String _$userDataProviderHash() => r'be4da20e04ff27f82a3132ac8aa1cd5ee1e3e845';

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
