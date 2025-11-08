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
import 'package:control/models/user.dart';

// TODO: separate into separate providers for features (projects, defects, etc)
@Deprecated("Use feature-specific data providers instead")
abstract interface class IDataProvider {
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
  Future<PatchProjectResponse> patchProject(PatchProjectRequest request);
  Future<void> deleteProject(String projectId);
}

abstract class IReportDataProvider {
  final String projectId;

  const IReportDataProvider(this.projectId);

  Future<CreateReportResponse> createReport(CreateReportRequest request);
  Future<GetReportByIdResponse> getReportById(String reportId);
  Future<GetReportsByProjectIdResponse> getReportByProjectId(
    GetReportsByProjectIdRequest request,
  );
  Future<PatchReportResponse> patchReport(PatchReportRequest request);
  Future<void> deleteReport({
    required String reportId,
    required String projectId,
  });
}

abstract class IDefectDataProvider {
  final String reportId;

  const IDefectDataProvider(this.reportId);

  Future<CreateDefectResponse> createDefect(CreateDefectRequest request);
  Future<GetDefectByIdResponse> getDefectById(GetDefectByIdRequest request);
  Future<GetDefectsByReportIdResponse> getDefectsByReportId(
    GetDefectsByReportIdRequest request,
  );
  Future<PatchDefectByIdResponse> patchDefect(PatchDefectByIdRequest request);
  Future<void> deleteDefect({
    required String defectId,
    required String reportId,
  });
}

abstract class IDefectAttachmentProvider {
  final String defectId;

  const IDefectAttachmentProvider(this.defectId);

  Future<CreateDefectAttachmentResponse> uploadDefectAttachment(
    CreateDefectAttachmentRequest request,
  );
  Future<GetDefectAttachmentsResponse> getDefectAttachments(
    GetDefectAttachementsRequest request,
  );
  Future<void> deleteDefectAttachment(String attachmentId);
}
