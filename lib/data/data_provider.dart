import 'package:control/data/idata_provider.dart';
import 'package:control/models/models.dart';
import 'package:control/models/network/defect/create_defect.dart';
import 'package:control/models/network/defect/get_defect_by_id.dart';
import 'package:control/models/network/defect/get_defects_by_report_id.dart';
import 'package:control/models/network/defect/patch_defect_by_id.dart';
import 'package:control/models/network/defect_attachments/create_defect_attachment.dart';
import 'package:control/models/network/defect_attachments/get_defect_attachments.dart';
import 'package:control/models/network/project/create_project.dart';
import 'package:control/models/network/project/get_project_by_id.dart';
import 'package:control/models/network/project/get_projects.dart';
import 'package:control/models/network/project/patch_project.dart';
import 'package:control/models/network/report/create_report.dart';
import 'package:control/models/network/report/get_report_by_id.dart';
import 'package:control/models/network/report/get_reports_by_project_id.dart';
import 'package:control/models/network/report/patch_report.dart';
import 'package:control/models/network/user/create_user.dart';
import 'package:control/models/network/user/login_user.dart';
import 'package:control/models/user.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

class DataProvider implements IDataProvider {
  const DataProvider(this.dio);

  final Dio dio;

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
    final response = await dio.get(
      "api/projects",
      queryParameters: request.queryParams,
    );
    final data = GetProjectsResponse.fromJson(response.data);
    return data;
  }

  @override
  Future<PatchProjectResponse> patchProject(PatchProjectRequest request) {
    final projectId = request.projectId;
    return dio
        .patch('api/projects/$projectId', data: request.toJson())
        .then((response) => PatchProjectResponse.fromJson(response.data));
  }

  @override
  Future<void> deleteProject(String projectId) {
    return dio.delete('api/projects/$projectId');
  }
}

class ReportDataProvider implements IReportDataProvider {
  final Dio dio;
  @override
  final String projectId;

  const ReportDataProvider(this.dio, this.projectId);

  @override
  Future<CreateReportResponse> createReport(CreateReportRequest request) async {
    final response = await dio.post(
      '/api/projects/$projectId/reports',
      data: request.toJson(),
    );
    return CreateReportResponse.fromJson(response.data);
  }

  @override
  Future<GetReportByIdResponse> getReportById(String reportId) async {
    final response = await dio.get('api/projects/$projectId/reports/$reportId');
    return GetReportByIdResponse.fromJson(response.data);
  }

  @override
  Future<GetReportsByProjectIdResponse> getReportByProjectId(
    GetReportsByProjectIdRequest request,
  ) async {
    final response = await dio.get(
      'api/projects/$projectId/reports',
      queryParameters: request.queryParams,
    );
    return GetReportsByProjectIdResponse.fromJson(response.data);
  }

  @override
  Future<PatchReportResponse> patchReport(PatchReportRequest request) {
    final reportId = request.reportId;
    return dio
        .patch(
          'api/projects/$projectId/reports/$reportId',
          data: request.toJson(),
        )
        .then((response) => PatchReportResponse.fromJson(response.data));
  }

  @override
  Future<void> deleteReport({
    required String reportId,
    required String projectId,
  }) {
    return dio.delete('api/projects/$projectId/reports/$reportId');
  }
}

class DefectDataProvider implements IDefectDataProvider {
  @override
  final String reportId;
  final Dio dio;

  const DefectDataProvider({required this.dio, required this.reportId});
  @override
  Future<CreateDefectResponse> createDefect(CreateDefectRequest request) async {
    final response = await dio.post(
      'api/reports/$reportId/defects',
      data: request.toJson(),
    );
    return Future.value(CreateDefectResponse.fromJson(response.data));
  }

  @override
  Future<GetDefectByIdResponse> getDefectById(
    GetDefectByIdRequest request,
  ) async {
    final defectId = request.defectId;
    final response = await dio.get('api/reports/$reportId/defects/$defectId');
    return GetDefectByIdResponse.fromJson(response.data);
  }

  @override
  Future<GetDefectsByReportIdResponse> getDefectsByReportId(
    GetDefectsByReportIdRequest request,
  ) async {
    final response = await dio.get(
      'api/reports/$reportId/defects',
      queryParameters: request.queryParams,
    );
    return GetDefectsByReportIdResponse.fromJson(response.data);
  }

  @override
  Future<PatchDefectByIdResponse> patchDefect(
    PatchDefectByIdRequest request,
  ) async {
    final reportId = request.reportId;
    final defectId = request.defectId;
    final response = await dio.patch(
      'api/reports/$reportId/defects/$defectId',
      data: request.toJson(),
    );
    return PatchDefectByIdResponse.fromJson(response.data);
  }

  @override
  Future<void> deleteDefect({
    required String defectId,
    required String reportId,
  }) async {
    await dio.delete('api/reports/$reportId/defects/$defectId');
  }
}

class DefectAttachmentProvider implements IDefectAttachmentProvider {
  @override
  final String defectId;
  final Dio dio;

  const DefectAttachmentProvider({required this.dio, required this.defectId});

  @override
  Future<CreateDefectAttachmentResponse> uploadDefectAttachment(
    PlatformFile file,
  ) async {
    final fileBytes = file.bytes?.toList();
    if (fileBytes == null) {
      throw Exception('File bytes are null');
    }
    final response = await dio.post(
      'api/defects/$defectId/attachments',
      data: MultipartFile.fromBytes(fileBytes),
      options: Options(contentType: 'multipart/form-data'),
    );

    return CreateDefectAttachmentResponse.fromJson(response.data);
  }

  @override
  Future<GetDefectAttachmentsResponse> getDefectAttachments(
    GetDefectAttachementsRequest request,
  ) async {
    final response = await dio.get(
      'api/defects/$defectId/attachments',
      queryParameters: request.queryParams,
    );
    return GetDefectAttachmentsResponse.fromJson(response.data);
  }

  @override
  Future<void> deleteDefectAttachment(String attachmentId) {
    return dio.delete('api/defects/$defectId/attachments/$attachmentId');
  }
}
