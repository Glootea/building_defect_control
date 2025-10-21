import 'package:control/data/idata_provider.dart';
import 'package:control/models/models.dart';
import 'package:control/models/network/pagination/paginated_response.dart';
import 'package:control/models/network/project/create_project.dart';
import 'package:control/models/network/project/get_project_by_id.dart';
import 'package:control/models/network/project/get_projects.dart';
import 'package:control/models/network/user/create_user.dart';
import 'package:control/models/user.dart';
import 'package:uuid/uuid.dart';

class TestingDataProvider implements IDataProvider {
  final Uuid _uuid = Uuid();

  late final _projects = [
    Project(id: _uuid.v7(), name: 'Create a new app', defects: _defects),
  ];

  late final _defects = [
    Defect(
      id: _uuid.v7(),
      name: 'UI Bug',
      description: 'Button not aligned properly',
      status: DefectStatus.open,
      classification: 'Minor',
    ),
    Defect(
      id: _uuid.v7(),
      name: 'Crash on Load',
      description: 'App crashes when loading data',
      status: DefectStatus.inProgress,
      classification: 'Critical',
    ),
  ];
  @override
  Future<List<Defect>> getDefects(String projectId) async {
    await _simulateDelay();
    return _defects;
  }

  @override
  Future<Project> updateProject(Project project) async {
    final index = _projects.indexWhere((p) => p.id == project.id);
    if (index != -1) {
      _projects[index] = project;
    }

    await _simulateDelay();
    // Simulate saving the project name
    return project;
  }

  @override
  Future<Defect> getDefect(String defectId) async {
    final defect = _defects.firstWhere((d) => d.id == defectId);
    await _simulateDelay();
    return defect;
  }

  @override
  Future<Defect> updateDefect(Defect defect) async {
    final index = _defects.indexWhere((d) => d.id == defect.id);
    if (index != -1) {
      print('Failed to find defect with id ${defect.id}');
      _defects[index] = defect;
    }
    print('Updated defect: $defect');
    await _simulateDelay();
    return defect;
  }

  @override
  Future<Project> getProject(String projectId) async {
    final project = _projects.firstWhere((p) => p.id == projectId);

    await _simulateDelay();
    return project;
  }

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
  Future<(UserData, String)> loginUser(String email, String password) {
    if (email == 'admin@admin.com' && password == 'admin') {
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
    storage.projects.add(Project(id: newId, name: request.name, defects: []));
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
          data: pagedProjects
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
        data: projects,
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

class TestingDataStorage {
  late final List<Project> projects = [
    Project(id: Uuid().v7(), name: 'Sample Project', defects: [...defects]),
    Project(id: Uuid().v7(), name: 'Sample Project 2', defects: [...defects]),
    Project(id: Uuid().v7(), name: 'Sample Project 3', defects: [...defects]),
    Project(id: Uuid().v7(), name: 'Sample Project 4', defects: [...defects]),
  ];

  late final List<Project> generatedProjects = List.generate(
    100,
    (index) => Project(
      id: Uuid().v7(),
      name: 'Generated Project ${index + 1}',
      defects: [...defects],
    ),
  );

  final List<Defect> defects = [
    Defect(
      id: Uuid().v7(),
      name: 'Sample Defect 1',
      description: 'This is a sample defect description and elimination',
      status: DefectStatus.closed,
      classification: 'Minor',
    ),
    Defect(
      id: Uuid().v7(),
      name: 'Sample Defect 2',
      description: 'This is another sample defect description.',
      status: DefectStatus.inProgress,
      classification: 'Major',
    ),
  ];

  late final List<DefectElimination> eliminations = [
    if (defects.isNotEmpty)
      DefectElimination(
        id: Uuid().v7(),
        defectId: defects[0].id,
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
