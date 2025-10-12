import 'package:control/data/idata_provider.dart';
import 'package:control/models/models.dart';
import 'package:control/models/network/user/create_user.dart';
import 'package:control/models/network/user/login_user.dart';
import 'package:dio/dio.dart';

class DataProvider implements IDataProvider {
  const DataProvider(this.dio);

  final Dio dio;

  @override
  Future<List<ProjectShallow>> getProjects() async {
    return [];
  }

  @override
  Future<List<Defect>> getDefects(String projectId) async {
    return [];
  }

  @override
  Future<Project> updateProject(Project project) {
    // TODO: implement saveProjectName
    throw UnimplementedError();
  }

  @override
  Future<ProjectShallow> createProject(String name) {
    // TODO: implement createProject
    throw UnimplementedError();
  }

  @override
  Future<Defect> getDefect(String defectId) {
    // TODO: implement getDefect
    throw UnimplementedError();
  }

  @override
  Future<Defect> updateDefect(Defect defect) {
    // TODO: implement updateDefect
    throw UnimplementedError();
  }

  @override
  Future<Project> getProject(String projectId) {
    // TODO: implement getProject
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getExecutors() async {
    // TODO: implement getExecutors
    throw UnimplementedError();
  }

  @override
  Future<DefectElimination?> getDefectElimination(String defectId) {
    // TODO: implement getDefectElimination
    throw UnimplementedError();
  }

  @override
  Future<void> createDefectElimination(String defectId) {
    // TODO: implement createDefectElimination
    throw UnimplementedError();
  }

  @override
  Future<void> updateDefectElimination(DefectElimination elimination) {
    // TODO: implement updateDefectElimination
    throw UnimplementedError();
  }

  @override
  Future<void> deleteDefectElimination(String defectId) {
    // TODO: implement deleteDefectElimination
    throw UnimplementedError();
  }
}

class UserDataProvider implements IUserDataProvider {
  const UserDataProvider(this.dio);

  final Dio dio;

  @override
  Future<CreateUserResponse> createUser(CreateUserRequest request) async {
    final response = await dio.post('/api/user', data: request.toJson());
    return CreateUserResponse.fromJson(response.data);
  }

  @override
  Future<LoginUserResponse> loginUser(LoginUserRequest request) async {
    final response = await dio.post('/api/login', data: request.toJson());
    return LoginUserResponse.fromJson(response.data);
  }
}
