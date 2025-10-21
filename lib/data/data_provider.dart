import 'package:control/data/idata_provider.dart';
import 'package:control/models/models.dart';
import 'package:control/models/network/project/create_project.dart';
import 'package:control/models/network/project/get_project_by_id.dart';
import 'package:control/models/network/project/get_projects.dart';
import 'package:control/models/network/user/create_user.dart';
import 'package:control/models/network/user/login_user.dart';
import 'package:control/models/user.dart';
import 'package:dio/dio.dart';

class DataProvider implements IDataProvider {
  const DataProvider(this.dio);

  final Dio dio;

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
  Future<String> createUser(CreateUserRequest request) async {
    final response = await dio.post('api/user', data: request.toJson());
    final data = CreateUserResponse.fromJson(response.data);
    return data.id;
  }

  @override
  Future<(UserData, String)> loginUser(String email, String password) async {
    final request = LoginUserRequest(email: email, password: password);
    final response = await dio.post('api/login', data: request.toJson());
    final data = LoginUserResponse.fromJson(response.data);
    return (data.userData, data.token);
  }
}

class ProjectDataProvider implements IProjectDataProvider {
  const ProjectDataProvider(this.dio);

  final Dio dio;

  @override
  Future<CreateProjectResponse> createProject(
    CreateProjectRequest request,
  ) async {
    final response = await dio.post("api/projects", data: request.toJson());
    final data = CreateProjectResponse.fromJson(response.data);
    return data;
  }

  @override
  Future<GetProjectByIdResponse> getProjectById(String projectId) async {
    final response = await dio.post("api/projects/$projectId");
    final data = GetProjectByIdResponse.fromJson(response.data);
    return data;
  }

  @override
  Future<GetProjectsResponse> getProjects(GetProjectsRequest request) async {
    final response = await dio.get("api/projects", data: request.toJson());
    final data = GetProjectsResponse.fromJson(response.data);
    return data;
  }
}
