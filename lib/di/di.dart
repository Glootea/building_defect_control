import 'package:control/data/data_provider.dart';
import 'package:control/data/idata_provider.dart';
import 'package:control/domain/network.dart';
import 'package:control/data/testing_data_provider.dart';
import 'package:control/domain/user_cache.dart';
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
  print("Initialized TestingDataStorage at ${value.hashCode}");
  return value;
}

@riverpod
IDefectDataProvider defectDataProvider(Ref ref, String reportId) {
  final dio = ref.watch(dioClientProvider);
  return DefectDataProvider(dio: dio, reportId: reportId);
}

@riverpod
IDefectDataProvider testingDefectDataProvider(Ref ref, String reportId) {
  return TestingDefectDataProvider(
    ref.watch(testingDataStorageProvider),
    reportId,
  );
}
