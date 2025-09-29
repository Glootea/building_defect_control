import 'package:control/data/idata_provider.dart';
import 'package:control/models/models.dart';
import 'package:uuid/uuid.dart';

class TestingDataProvider implements IDataProvider {
  final Uuid _uuid = Uuid();

  late final _projects = [
    Project(id: _uuid.v7(), name: 'Create a new app', defects: _defects),
  ];
  @override
  Future<List<ProjectShallow>> getProjects() async {
    await _simulateDelay();
    return _projects
        .map((e) => ProjectShallow(id: e.id, name: e.name))
        .toList();
  }

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
  Future<ProjectShallow> createProject(String name) async {
    final newProject = ProjectShallow(id: _uuid.v7(), name: name);
    _projects.add(Project(id: newProject.id, name: name, defects: []));
    await _simulateDelay();
    return newProject;
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
