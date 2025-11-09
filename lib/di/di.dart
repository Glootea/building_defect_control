import 'package:control/data/data_provider.dart';
import 'package:control/data/idata_provider.dart';
import 'package:control/domain/network/network.dart';
import 'package:control/data/testing_data_provider.dart';
import 'package:control/domain/user/user_cache.dart';
import 'package:control/navigation/guard.dart';
import 'package:control/utils/resizable_row_builder.dart';
import 'package:control/utils/timed_callbacks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'di.g.dart';

@riverpod
IDataProvider dataProvider(Ref ref) {
  final dio = ref.watch(dioClientProvider);
  return DataProvider(dio);
}

@Riverpod(keepAlive: true)
IDataProvider testingDataProvider(Ref ref) {
  return TestingDataProvider();
}

@riverpod
IUserDataProvider userDataProvider(Ref ref) {
  final dio = ref.watch(dioClientProvider);
  return UserDataProvider(dio);
}

@riverpod
IUserDataProvider testingUserDataProvider(Ref ref) {
  return const TestingUserDataProvider();
}

@riverpod
Uuid uuid(Ref ref) => Uuid();

@riverpod
FlutterSecureStorage secureStorage(Ref ref) {
  return const FlutterSecureStorage();
}

@riverpod
UserCache userCache(Ref ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  return UserCache(secureStorage: secureStorage);
}

@riverpod
IProjectDataProvider projectDataProvider(Ref ref) {
  final dio = ref.watch(dioClientProvider);
  return ProjectDataProvider(dio);
}

@riverpod
IReportDataProvider reportDataProvider(Ref ref, String projectId) {
  final dio = ref.watch(dioClientProvider);
  return ReportDataProvider(dio, projectId);
}

@Riverpod(keepAlive: true)
IReportDataProvider testingReportDataProvider(Ref ref, String projectId) {
  return TestingReportDataProvider(
    ref.watch(testingDataStorageProvider),
    projectId,
  );
}

@riverpod
IProjectDataProvider testingProjectDataProvider(Ref ref) {
  return TestingProjectDataProvider(ref.watch(testingDataStorageProvider));
}

@Riverpod(keepAlive: true)
TestingDataStorage testingDataStorage(Ref ref) {
  final value = TestingDataStorage();
  return value;
}

@riverpod
IDefectDataProvider defectDataProvider(Ref ref, String reportId) {
  final dio = ref.watch(dioClientProvider);
  return DefectDataProvider(dio: dio, reportId: reportId);
}

@riverpod
IDefectAttachmentProvider defectAttachmentProvider(Ref ref, String defectId) {
  final dio = ref.watch(dioClientProvider);
  return DefectAttachmentProvider(dio: dio, defectId: defectId);
}

@Riverpod(keepAlive: true)
IDefectAttachmentProvider testingDefectAttachmentProvider(
  Ref ref,
  String defectId,
) {
  return TestingDefectAttachmentDataProvider(
    ref.watch(testingDataStorageProvider),
    defectId,
  );
}

@riverpod
IDefectDataProvider testingDefectDataProvider(Ref ref, String reportId) {
  return TestingDefectDataProvider(
    ref.watch(testingDataStorageProvider),
    reportId,
  );
}

@riverpod
ResizableRowStorage resizableRowStorage(Ref ref, String id) {
  final secureStorage = ref.watch(secureStorageProvider);
  return SecureStorageResizableRowStorage(id: id, secureStorage: secureStorage);
}

@riverpod
ControlNavigatorObserver navigatorStackObserver(Ref ref) {
  return ControlNavigatorObserver();
}

const _debounceDuration = Duration(milliseconds: 300);

final debouncerProvider = Provider.autoDispose(
  (_) => Debouncer(duration: _debounceDuration),
);

final riverpodDebouncerProvider = Provider.autoDispose(
  (_) => RiverpodDebouncer(duration: _debounceDuration),
);

final projectListUpdaterProvider = Provider.autoDispose((_) => DateTime.now());
final reportListUpdaterProvider = Provider.autoDispose((_) => DateTime.now());
final defectListUpdaterProvider = Provider.autoDispose((_) => DateTime.now());
final defectAttachmentListUpdaterProvider = Provider.autoDispose(
  (_) => DateTime.now(),
);
