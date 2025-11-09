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

@ProviderFor(projectDataProvider)
const projectDataProviderProvider = ProjectDataProviderProvider._();

final class ProjectDataProviderProvider
    extends
        $FunctionalProvider<
          IProjectDataProvider,
          IProjectDataProvider,
          IProjectDataProvider
        >
    with $Provider<IProjectDataProvider> {
  const ProjectDataProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectDataProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectDataProviderHash();

  @$internal
  @override
  $ProviderElement<IProjectDataProvider> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IProjectDataProvider create(Ref ref) {
    return projectDataProvider(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IProjectDataProvider value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IProjectDataProvider>(value),
    );
  }
}

String _$projectDataProviderHash() =>
    r'3d070ecab0cf457df1eb1a4c49bf651e84a0a79f';

@ProviderFor(reportDataProvider)
const reportDataProviderProvider = ReportDataProviderFamily._();

final class ReportDataProviderProvider
    extends
        $FunctionalProvider<
          IReportDataProvider,
          IReportDataProvider,
          IReportDataProvider
        >
    with $Provider<IReportDataProvider> {
  const ReportDataProviderProvider._({
    required ReportDataProviderFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'reportDataProviderProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$reportDataProviderHash();

  @override
  String toString() {
    return r'reportDataProviderProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<IReportDataProvider> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IReportDataProvider create(Ref ref) {
    final argument = this.argument as String;
    return reportDataProvider(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IReportDataProvider value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IReportDataProvider>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ReportDataProviderProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reportDataProviderHash() =>
    r'4df8083c00b2547736774bb458fe7f069ec661fb';

final class ReportDataProviderFamily extends $Family
    with $FunctionalFamilyOverride<IReportDataProvider, String> {
  const ReportDataProviderFamily._()
    : super(
        retry: null,
        name: r'reportDataProviderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ReportDataProviderProvider call(String projectId) =>
      ReportDataProviderProvider._(argument: projectId, from: this);

  @override
  String toString() => r'reportDataProviderProvider';
}

@ProviderFor(testingReportDataProvider)
const testingReportDataProviderProvider = TestingReportDataProviderFamily._();

final class TestingReportDataProviderProvider
    extends
        $FunctionalProvider<
          IReportDataProvider,
          IReportDataProvider,
          IReportDataProvider
        >
    with $Provider<IReportDataProvider> {
  const TestingReportDataProviderProvider._({
    required TestingReportDataProviderFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'testingReportDataProviderProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$testingReportDataProviderHash();

  @override
  String toString() {
    return r'testingReportDataProviderProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<IReportDataProvider> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IReportDataProvider create(Ref ref) {
    final argument = this.argument as String;
    return testingReportDataProvider(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IReportDataProvider value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IReportDataProvider>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TestingReportDataProviderProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$testingReportDataProviderHash() =>
    r'3aaa65edb8ca00630ddef30864547bd585d3a0a3';

final class TestingReportDataProviderFamily extends $Family
    with $FunctionalFamilyOverride<IReportDataProvider, String> {
  const TestingReportDataProviderFamily._()
    : super(
        retry: null,
        name: r'testingReportDataProviderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  TestingReportDataProviderProvider call(String projectId) =>
      TestingReportDataProviderProvider._(argument: projectId, from: this);

  @override
  String toString() => r'testingReportDataProviderProvider';
}

@ProviderFor(testingProjectDataProvider)
const testingProjectDataProviderProvider =
    TestingProjectDataProviderProvider._();

final class TestingProjectDataProviderProvider
    extends
        $FunctionalProvider<
          IProjectDataProvider,
          IProjectDataProvider,
          IProjectDataProvider
        >
    with $Provider<IProjectDataProvider> {
  const TestingProjectDataProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'testingProjectDataProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$testingProjectDataProviderHash();

  @$internal
  @override
  $ProviderElement<IProjectDataProvider> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IProjectDataProvider create(Ref ref) {
    return testingProjectDataProvider(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IProjectDataProvider value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IProjectDataProvider>(value),
    );
  }
}

String _$testingProjectDataProviderHash() =>
    r'61cbdbe4ebe0ac1c5be2e814794574534454e4c6';

@ProviderFor(testingDataStorage)
const testingDataStorageProvider = TestingDataStorageProvider._();

final class TestingDataStorageProvider
    extends
        $FunctionalProvider<
          TestingDataStorage,
          TestingDataStorage,
          TestingDataStorage
        >
    with $Provider<TestingDataStorage> {
  const TestingDataStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'testingDataStorageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$testingDataStorageHash();

  @$internal
  @override
  $ProviderElement<TestingDataStorage> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TestingDataStorage create(Ref ref) {
    return testingDataStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TestingDataStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TestingDataStorage>(value),
    );
  }
}

String _$testingDataStorageHash() =>
    r'aa13a12d5fdb61de723fbefa8982f894c2ef56b2';

@ProviderFor(defectDataProvider)
const defectDataProviderProvider = DefectDataProviderFamily._();

final class DefectDataProviderProvider
    extends
        $FunctionalProvider<
          IDefectDataProvider,
          IDefectDataProvider,
          IDefectDataProvider
        >
    with $Provider<IDefectDataProvider> {
  const DefectDataProviderProvider._({
    required DefectDataProviderFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'defectDataProviderProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$defectDataProviderHash();

  @override
  String toString() {
    return r'defectDataProviderProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<IDefectDataProvider> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IDefectDataProvider create(Ref ref) {
    final argument = this.argument as String;
    return defectDataProvider(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IDefectDataProvider value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IDefectDataProvider>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DefectDataProviderProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$defectDataProviderHash() =>
    r'194df2d1f63ba2d9123b7f5029b73b3f17b3dfc7';

final class DefectDataProviderFamily extends $Family
    with $FunctionalFamilyOverride<IDefectDataProvider, String> {
  const DefectDataProviderFamily._()
    : super(
        retry: null,
        name: r'defectDataProviderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DefectDataProviderProvider call(String reportId) =>
      DefectDataProviderProvider._(argument: reportId, from: this);

  @override
  String toString() => r'defectDataProviderProvider';
}

@ProviderFor(defectAttachmentProvider)
const defectAttachmentProviderProvider = DefectAttachmentProviderFamily._();

final class DefectAttachmentProviderProvider
    extends
        $FunctionalProvider<
          IDefectAttachmentProvider,
          IDefectAttachmentProvider,
          IDefectAttachmentProvider
        >
    with $Provider<IDefectAttachmentProvider> {
  const DefectAttachmentProviderProvider._({
    required DefectAttachmentProviderFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'defectAttachmentProviderProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$defectAttachmentProviderHash();

  @override
  String toString() {
    return r'defectAttachmentProviderProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<IDefectAttachmentProvider> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IDefectAttachmentProvider create(Ref ref) {
    final argument = this.argument as String;
    return defectAttachmentProvider(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IDefectAttachmentProvider value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IDefectAttachmentProvider>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DefectAttachmentProviderProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$defectAttachmentProviderHash() =>
    r'1626067a5bbd10c956375388ee55cf98880e3e7f';

final class DefectAttachmentProviderFamily extends $Family
    with $FunctionalFamilyOverride<IDefectAttachmentProvider, String> {
  const DefectAttachmentProviderFamily._()
    : super(
        retry: null,
        name: r'defectAttachmentProviderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DefectAttachmentProviderProvider call(String defectId) =>
      DefectAttachmentProviderProvider._(argument: defectId, from: this);

  @override
  String toString() => r'defectAttachmentProviderProvider';
}

@ProviderFor(testingDefectAttachmentProvider)
const testingDefectAttachmentProviderProvider =
    TestingDefectAttachmentProviderFamily._();

final class TestingDefectAttachmentProviderProvider
    extends
        $FunctionalProvider<
          IDefectAttachmentProvider,
          IDefectAttachmentProvider,
          IDefectAttachmentProvider
        >
    with $Provider<IDefectAttachmentProvider> {
  const TestingDefectAttachmentProviderProvider._({
    required TestingDefectAttachmentProviderFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'testingDefectAttachmentProviderProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$testingDefectAttachmentProviderHash();

  @override
  String toString() {
    return r'testingDefectAttachmentProviderProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<IDefectAttachmentProvider> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IDefectAttachmentProvider create(Ref ref) {
    final argument = this.argument as String;
    return testingDefectAttachmentProvider(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IDefectAttachmentProvider value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IDefectAttachmentProvider>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TestingDefectAttachmentProviderProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$testingDefectAttachmentProviderHash() =>
    r'e55d795771e73f8b76b84437197195c3f5801dd1';

final class TestingDefectAttachmentProviderFamily extends $Family
    with $FunctionalFamilyOverride<IDefectAttachmentProvider, String> {
  const TestingDefectAttachmentProviderFamily._()
    : super(
        retry: null,
        name: r'testingDefectAttachmentProviderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  TestingDefectAttachmentProviderProvider call(String defectId) =>
      TestingDefectAttachmentProviderProvider._(argument: defectId, from: this);

  @override
  String toString() => r'testingDefectAttachmentProviderProvider';
}

@ProviderFor(testingDefectDataProvider)
const testingDefectDataProviderProvider = TestingDefectDataProviderFamily._();

final class TestingDefectDataProviderProvider
    extends
        $FunctionalProvider<
          IDefectDataProvider,
          IDefectDataProvider,
          IDefectDataProvider
        >
    with $Provider<IDefectDataProvider> {
  const TestingDefectDataProviderProvider._({
    required TestingDefectDataProviderFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'testingDefectDataProviderProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$testingDefectDataProviderHash();

  @override
  String toString() {
    return r'testingDefectDataProviderProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<IDefectDataProvider> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IDefectDataProvider create(Ref ref) {
    final argument = this.argument as String;
    return testingDefectDataProvider(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IDefectDataProvider value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IDefectDataProvider>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TestingDefectDataProviderProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$testingDefectDataProviderHash() =>
    r'efcf7551a1e495995104799f57892d1ff65ed586';

final class TestingDefectDataProviderFamily extends $Family
    with $FunctionalFamilyOverride<IDefectDataProvider, String> {
  const TestingDefectDataProviderFamily._()
    : super(
        retry: null,
        name: r'testingDefectDataProviderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TestingDefectDataProviderProvider call(String reportId) =>
      TestingDefectDataProviderProvider._(argument: reportId, from: this);

  @override
  String toString() => r'testingDefectDataProviderProvider';
}

@ProviderFor(resizableRowStorage)
const resizableRowStorageProvider = ResizableRowStorageFamily._();

final class ResizableRowStorageProvider
    extends
        $FunctionalProvider<
          ResizableRowStorage,
          ResizableRowStorage,
          ResizableRowStorage
        >
    with $Provider<ResizableRowStorage> {
  const ResizableRowStorageProvider._({
    required ResizableRowStorageFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'resizableRowStorageProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$resizableRowStorageHash();

  @override
  String toString() {
    return r'resizableRowStorageProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ResizableRowStorage> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ResizableRowStorage create(Ref ref) {
    final argument = this.argument as String;
    return resizableRowStorage(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResizableRowStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResizableRowStorage>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ResizableRowStorageProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$resizableRowStorageHash() =>
    r'6950b641400acf36636726affecc8c7ab6893cc6';

final class ResizableRowStorageFamily extends $Family
    with $FunctionalFamilyOverride<ResizableRowStorage, String> {
  const ResizableRowStorageFamily._()
    : super(
        retry: null,
        name: r'resizableRowStorageProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ResizableRowStorageProvider call(String id) =>
      ResizableRowStorageProvider._(argument: id, from: this);

  @override
  String toString() => r'resizableRowStorageProvider';
}

@ProviderFor(navigatorStackObserver)
const navigatorStackObserverProvider = NavigatorStackObserverProvider._();

final class NavigatorStackObserverProvider
    extends
        $FunctionalProvider<
          ControlNavigatorObserver,
          ControlNavigatorObserver,
          ControlNavigatorObserver
        >
    with $Provider<ControlNavigatorObserver> {
  const NavigatorStackObserverProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'navigatorStackObserverProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$navigatorStackObserverHash();

  @$internal
  @override
  $ProviderElement<ControlNavigatorObserver> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ControlNavigatorObserver create(Ref ref) {
    return navigatorStackObserver(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ControlNavigatorObserver value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ControlNavigatorObserver>(value),
    );
  }
}

String _$navigatorStackObserverHash() =>
    r'b779e45c0be7b8df8d8229f09188d03bbfa40835';
