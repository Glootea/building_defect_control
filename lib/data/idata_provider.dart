import 'package:control/data/data_provider.dart';
import 'package:control/data/testing_data_provider.dart';
import 'package:control/models/models.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
part 'idata_provider.g.dart';

abstract interface class IDataProvider {
  Future<List<ProjectShallow>> getProjects();
  Future<ProjectShallow> createProject(String name);
  Future<Project> getProject(String projectId);
  Future<List<Defect>> getDefects(String projectId);
  Future<Project> updateProject(Project project);
  Future<Defect> getDefect(String defectId);
  Future<Defect> updateDefect(Defect defect);
}

@riverpod
IDataProvider dataProvider(Ref ref) {
  final dio = ref.read(getDioProvider);
  return DataProvider(dio);
}

@Riverpod(keepAlive: true)
IDataProvider testingDataProvider(Ref ref) {
  return TestingDataProvider();
}

@riverpod
Dio getDio(Ref ref) {
  final dio = Dio();
  return dio;
}

@riverpod
Uuid uuid(Ref ref) => Uuid();

@riverpod
Uuid testingUuid(Ref ref) => Uuid();

extension UuidX on Uuid {
  String generate() => v7();
}
