import 'dart:math';

import 'package:control/data/idata_provider.dart';
import 'package:control/models/models.dart';
import 'package:control/models/network/defect/create_defect.dart';
import 'package:control/models/network/defect/get_defect_by_id.dart';
import 'package:control/models/network/defect/get_defects_by_report_id.dart';
import 'package:control/models/network/defect/patch_defect_by_id.dart';
import 'package:control/models/network/pagination/paginated_response.dart';
import 'package:control/models/network/project/create_project.dart';
import 'package:control/models/network/project/get_project_by_id.dart';
import 'package:control/models/network/project/get_projects.dart';
import 'package:control/models/network/report/create_report.dart';
import 'package:control/models/network/report/get_report_by_id.dart';
import 'package:control/models/network/report/get_reports_by_project_id.dart';
import 'package:control/models/network/user/create_user.dart';
import 'package:control/models/user.dart';
import 'package:uuid/uuid.dart';

class TestingDataProvider implements IDataProvider {
  final Uuid _uuid = Uuid();

  final List<String> _executors = [
    'Alice Johnson',
    'Bob Smith',
    'Charlie Davis',
    'Diana Evans',
    'Ethan Brown',
  ];

  @override
  Future<List<String>> getExecutors() async {
    await _simulateDelay();
    return Future.value(_executors);
  }

  final List<DefectElimination> _eliminations = [];
  @override
  Future<DefectElimination?> getDefectElimination(String defectId) async {
    await _simulateDelay();
    final index = _eliminations.indexWhere((e) => e.defectId == defectId);
    if (index != -1) {
      return _eliminations[index];
    }
    return null;
  }

  @override
  Future<void> createDefectElimination(String defectId) {
    final newElimination = DefectElimination(
      defectId: defectId,
      id: _uuid.v7(),
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(hours: 2)),
      priority: Priority.medium,
    );

    _eliminations.add(newElimination);
    return _simulateDelay();
  }

  @override
  Future<void> updateDefectElimination(DefectElimination elimination) {
    final index = _eliminations.indexWhere((e) => e.id == elimination.id);
    if (index != -1) {
      _eliminations[index] = elimination;
    }
    return _simulateDelay();
  }

  @override
  Future<void> deleteDefectElimination(String defectId) {
    _eliminations.removeWhere((e) => e.defectId == defectId);
    return _simulateDelay();
  }
}

Future<void> _simulateDelay() async {
  await Future<void>.delayed(const Duration(seconds: 1));
}

class TestingUserDataProvider implements IUserDataProvider {
  const TestingUserDataProvider();

  @override
  Future<String> createUser(CreateUserRequest request) {
    return Future.value(const Uuid().v7());
  }

  @override
  Future<(UserData, String)> loginUser(String email, String password) async {
    if (email == 'admin@admin.com' && password == 'admin') {
      await _simulateDelay();
      return Future.value((
        UserData(
          firstName: 'Admin',
          middleName: 'User',
          lastName: 'Example',
          userRole: const UserRole.admin(),
          email: email,
          post: 'Administrator',
        ),
        const Uuid().v7(),
      ));
    }
    throw Exception('Invalid credentials for testing user');
  }
}

class TestingProjectDataProvider implements IProjectDataProvider {
  const TestingProjectDataProvider(this.storage);

  final TestingDataStorage storage;

  @override
  Future<CreateProjectResponse> createProject(
    CreateProjectRequest request,
  ) async {
    final newId = Uuid().v7();
    storage.projects.add(ProjectShallow(id: newId, name: request.name));
    await _simulateDelay();
    return Future.value(CreateProjectResponse(id: newId));
  }

  @override
  Future<GetProjectByIdResponse> getProjectById(String projectId) async {
    final project = storage.projects.firstWhere(
      (project) => project.id == projectId,
    );
    return Future.value(
      GetProjectByIdResponse(id: projectId, name: project.name),
    );
  }

  @override
  Future<GetProjectsResponse> getProjects(GetProjectsRequest request) async {
    if (request.name == 'multipage') {
      final pagination = request.pagination;
      if (pagination == null) {
        throw Exception(
          'Pagination parameters are required for multipage test',
        );
      }
      final currentPage = pagination.pageNumber;
      final pageSize = pagination.pageSize;
      final allProjects = storage.generatedProjects;
      final pagedProjects = allProjects
          .skip((currentPage - 1) * pageSize)
          .take(pageSize)
          .toList();
      final totalCount = allProjects.length;
      final totalPages = (totalCount / pageSize).ceil();
      return Future.value(
        GetProjectsResponse(
          projects: pagedProjects
              .map(
                (project) => ProjectShallow(id: project.id, name: project.name),
              )
              .toList(),
          metadata: PaginatedMetadata(
            currentPage: currentPage,
            pageSize: pageSize,
            totalCount: totalCount,
            totalPages: totalPages,
            hasPrevious: currentPage > 1,
            hasNext: currentPage < totalPages,
          ),
        ),
      );
    }
    final projects = storage.projects
        .where((project) {
          final query = request.name;
          if (query == null || query.isEmpty) {
            return true;
          }
          return project.name.toLowerCase().contains(query.toLowerCase());
        })
        .map((project) => ProjectShallow(id: project.id, name: project.name))
        .toList();
    return Future.value(
      GetProjectsResponse(
        projects: projects,
        metadata: PaginatedMetadata(
          currentPage: 1,
          pageSize: projects.length,
          totalCount: projects.length,
          totalPages: 1,
          hasPrevious: false,
          hasNext: false,
        ),
      ),
    );
  }
}

class TestingReportDataProvider implements IReportDataProvider {
  final TestingDataStorage storage;
  @override
  final String projectId;

  const TestingReportDataProvider(this.storage, this.projectId);

  @override
  Future<CreateReportResponse> createReport(CreateReportRequest request) async {
    final newId = Uuid().v7();
    storage.reports.add(
      Report(
        id: newId,
        name: request.name,
        description: request.description,
        submissionDate: DateTime.now(),
      ),
    );
    await _simulateDelay();
    return Future.value(CreateReportResponse(id: newId));
  }

  @override
  Future<GetReportByIdResponse> getReportById(String reportId) async {
    final report = storage.reports.firstWhere(
      (report) => report.id == reportId,
    );
    await _simulateDelay();
    return Future.value(
      GetReportByIdResponse(
        id: report.id,
        name: report.name,
        description: report.description,
        submissionDate: report.submissionDate,
      ),
    );
  }

  @override
  Future<GetReportsByProjectIdResponse> getReportByProjectId(
    GetReportsByProjectIdRequest request,
  ) async {
    if (request.name == 'multipage') {
      final pagination = request.pagination;
      if (pagination == null) {
        throw Exception(
          'Pagination parameters are required for multipage test',
        );
      }
      final currentPage = pagination.pageNumber;
      final pageSize = pagination.pageSize;
      final allReports = storage.generatedReports;
      final pagedReports = allReports
          .skip((currentPage - 1) * pageSize)
          .take(pageSize)
          .toList();
      final totalCount = allReports.length;
      final totalPages = (totalCount / pageSize).ceil();
      return Future.value(
        GetReportsByProjectIdResponse(
          data: pagedReports.toList(),
          metadata: PaginatedMetadata(
            currentPage: currentPage,
            pageSize: pageSize,
            totalCount: totalCount,
            totalPages: totalPages,
            hasPrevious: currentPage > 1,
            hasNext: currentPage < totalPages,
          ),
        ),
      );
    }
    final reports = storage.reports.where((project) {
      final query = request.name;
      if (query == null || query.isEmpty) {
        return true;
      }
      return project.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return Future.value(
      GetReportsByProjectIdResponse(
        data: reports,
        metadata: PaginatedMetadata(
          currentPage: 1,
          pageSize: reports.length,
          totalCount: reports.length,
          totalPages: 1,
          hasPrevious: false,
          hasNext: false,
        ),
      ),
    );
  }
}

class TestingDefectDataProvider implements IDefectDataProvider {
  final TestingDataStorage storage;
  @override
  final String reportId;

  const TestingDefectDataProvider(this.storage, this.reportId);

  @override
  Future<CreateDefectResponse> createDefect(CreateDefectRequest request) async {
    final newId = Uuid().v7();
    storage.defects.add(
      Defect(
        id: newId,
        name: request.name,
        description: request.description,
        classification: request.clazz,
        status: DefectStatus.open,
      ),
    );
    await _simulateDelay();
    return Future.value(CreateDefectResponse(id: newId));
  }

  @override
  Future<GetDefectByIdResponse> getDefectById(
    GetDefectByIdRequest request,
  ) async {
    final defect = storage.defects.where((e) => e.id == request.defectId).first;

    await _simulateDelay();
    return Future.value(
      GetDefectByIdResponse(
        id: defect.id,
        name: defect.name,
        description: defect.description,
        status: defect.status,
        clazz: defect.classification,
      ),
    );
  }

  @override
  Future<GetDefectsByReportIdResponse> getDefectsByReportId(
    GetDefectsByReportIdRequest request,
  ) async {
    if (request.name == 'multipage') {
      final pagination = request.pagination;
      if (pagination == null) {
        throw Exception(
          'Pagination parameters are required for multipage test',
        );
      }
      final currentPage = pagination.pageNumber;
      final pageSize = pagination.pageSize;
      final allDefects = storage.generatedDefects;
      final pagedReports = allDefects
          .skip((currentPage - 1) * pageSize)
          .take(pageSize)
          .toList();
      final totalCount = allDefects.length;
      final totalPages = (totalCount / pageSize).ceil();
      return Future.value(
        GetDefectsByReportIdResponse(
          data: pagedReports.toList(),
          metadata: PaginatedMetadata(
            currentPage: currentPage,
            pageSize: pageSize,
            totalCount: totalCount,
            totalPages: totalPages,
            hasPrevious: currentPage > 1,
            hasNext: currentPage < totalPages,
          ),
        ),
      );
    }
    final reports = storage.defects.where((project) {
      final query = request.name;
      if (query == null || query.isEmpty) {
        return true;
      }
      return project.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return Future.value(
      GetDefectsByReportIdResponse(
        data: reports,
        metadata: PaginatedMetadata(
          currentPage: 1,
          pageSize: reports.length,
          totalCount: reports.length,
          totalPages: 1,
          hasPrevious: false,
          hasNext: false,
        ),
      ),
    );
  }

  @override
  Future<PatchDefectByIdResponse> patchDefectById(
    PatchDefectByIdRequest request,
  ) {
    final storedElement = storage.defects.firstWhere(
      (defect) => defect.id == request.defectId,
    );
    storage.defects.remove(storedElement);
    final updatedElement = storedElement.copyWith(
      name: request.name ?? storedElement.name,
      description: request.description ?? storedElement.description,
      classification: request.classification ?? storedElement.classification,
      status: request.status ?? storedElement.status,
    );
    storage.defects.add(updatedElement);
    return Future.value(
      PatchDefectByIdResponse(
        id: updatedElement.id,
        name: updatedElement.name,
        description: updatedElement.description,
        clazz: updatedElement.classification,
        status: updatedElement.status,
      ),
    );
  }
}

class TestingDataStorage {
  late final _projectId = Uuid().v7();
  late final List<ProjectShallow> projects = [
    ProjectShallow(id: _projectId, name: 'Sample Project'),
    ProjectShallow(id: Uuid().v7(), name: 'Sample Project 2'),
    ProjectShallow(id: Uuid().v7(), name: 'Sample Project 3'),
    ProjectShallow(id: Uuid().v7(), name: 'Sample Project 4'),
  ];

  late final List<ProjectShallow> generatedProjects = List.generate(
    100,
    (index) =>
        ProjectShallow(id: Uuid().v7(), name: 'Generated Project ${index + 1}'),
  );

  late final List<Report> generatedReports = List.generate(
    100,
    (index) => Report(
      id: Uuid().v7(),
      name: 'Generated Project ${index + 1}',
      description: 'This is a generated report description',
      submissionDate: DateTime.now().subtract(Duration(days: index)),
    ),
  );

  late final _random = Random();
  late final List<Defect> generatedDefects = List.generate(
    100,
    (index) => Defect(
      id: Uuid().v7(),
      name: 'Generated Project ${index + 1}',
      description: 'This is a generated report description',
      classification: 'Classification ${index % 5} ',
      status: DefectStatus.values[_random.nextInt(DefectStatus.values.length)],
    ),
  );

  late final List<Report> reports = [
    Report(
      id: Uuid().v7(),
      name: 'Sample Report 1',
      description: 'This is a sample defect description and elimination',
      submissionDate: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Report(
      id: Uuid().v7(),
      name: 'Sample Report 2',
      description: 'This is a sample defect description',
      submissionDate: DateTime.now().subtract(const Duration(days: 5)),
    ),
  ];

  late final List<Defect> defects = [
    Defect(
      id: Uuid().v7(),
      name: 'UI Bug',
      description: 'Button not aligned properly',
      status: DefectStatus.open,
      classification: 'Minor',
    ),
    Defect(
      id: Uuid().v7(),
      name: 'Crash on Load',
      description: 'App crashes when loading data',
      status: DefectStatus.inProgress,
      classification: 'Critical',
    ),
  ];

  late final List<DefectElimination> eliminations = [
    if (reports.isNotEmpty)
      DefectElimination(
        id: Uuid().v7(),
        defectId: reports[0].id,
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 1)),
        priority: Priority.high,
      ),
  ];

  late final List<String> executors = [
    'John Doe',
    'Jane Smith',
    'Alice Johnson',
    'Bob Brown',
  ];
}
