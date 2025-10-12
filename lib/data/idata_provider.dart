import 'package:control/models/models.dart';
import 'package:control/models/network/user/create_user.dart';
import 'package:control/models/network/user/login_user.dart';
import 'package:uuid/uuid.dart';

// TODO: separate into separate providers for features (projects, defects, etc)
abstract interface class IDataProvider {
  Future<List<ProjectShallow>> getProjects();
  Future<ProjectShallow> createProject(String name);
  Future<Project> getProject(String projectId);
  Future<List<Defect>> getDefects(String projectId);
  Future<Project> updateProject(Project project);
  Future<Defect> getDefect(String defectId);
  Future<Defect> updateDefect(Defect defect);
  Future<List<String>> getExecutors();
  Future<DefectElimination?> getDefectElimination(String defectId);
  Future<void> createDefectElimination(String defectId);
  Future<void> deleteDefectElimination(String defectId);
  Future<void> updateDefectElimination(DefectElimination elimination);
}

abstract class IUserDataProvider {
  Future<CreateUserResponse> createUser(CreateUserRequest request);
  Future<LoginUserResponse> loginUser(LoginUserRequest request);
}

extension UuidX on Uuid {
  String generate() => v7();
}
