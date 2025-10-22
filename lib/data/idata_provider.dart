import 'package:control/models/models.dart';
import 'package:control/models/network/project/create_project.dart';
import 'package:control/models/network/project/get_project_by_id.dart';
import 'package:control/models/network/project/get_projects.dart';
import 'package:control/models/network/report/create_report.dart';
import 'package:control/models/network/report/get_report_by_id.dart';
import 'package:control/models/network/report/get_reports_by_project_id.dart';
import 'package:control/models/network/user/create_user.dart';
import 'package:control/models/user.dart';
import 'package:uuid/uuid.dart';

// TODO: separate into separate providers for features (projects, defects, etc)
abstract interface class IDataProvider {
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
  Future<String> createUser(CreateUserRequest request);
  Future<(UserData, String)> loginUser(String email, String password);
}

abstract class IProjectDataProvider {
  Future<CreateProjectResponse> createProject(CreateProjectRequest request);
  Future<GetProjectByIdResponse> getProjectById(String projectId);
  Future<GetProjectsResponse> getProjects(GetProjectsRequest request);
}

abstract class IReportDataProvider {
  final String projectId;
  const IReportDataProvider(this.projectId);

  Future<CreateReportResponse> createReport(CreateReportRequest request);
  Future<GetReportByIdResponse> getReportById(String reportId);
  Future<GetReportsByProjectIdResponse> getReportByProjectId(
    GetReportsByProjectIdRequest request,
  );
}

extension UuidX on Uuid {
  String generate() => v7();
}
