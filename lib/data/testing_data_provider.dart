import 'package:control/data/idata_provider.dart';
import 'package:control/models/models.dart';
import 'package:uuid/uuid.dart';

class TestingDataProvider implements IDataProvider {
  final Uuid _uuid = Uuid();
  late final _projectsShallow = [
    ProjectShallow(id: _uuid.v7(), name: 'Create a new app'),
  ];

  late final _projects = [
    Project(
      id: _projectsShallow[0].id,
      name: _projectsShallow[0].name,
      defects: _defects,
    ),
  ];
  @override
  Future<List<ProjectShallow>> getProjects() async {
    await _simulateDelay();
    return _projectsShallow;
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
      _projectsShallow[index] = ProjectShallow(
        id: project.id,
        name: project.name,
      );
    }

    await _simulateDelay();
    // Simulate saving the project name
    return project;
  }

  @override
  Future<ProjectShallow> createProject(String name) async {
    final newProject = ProjectShallow(id: _uuid.v7(), name: name);
    _projectsShallow.add(newProject);
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
      _defects[index] = defect;
    }
    await _simulateDelay();
    return defect;
  }

  @override
  Future<Project> getProject(String projectId) async {
    final projectShallow = _projectsShallow.firstWhere(
      (p) => p.id == projectId,
    );
    final project = Project(
      id: projectShallow.id,
      name: projectShallow.name,
      defects: _defects,
    );
    await _simulateDelay();
    return project;
  }
}

Future<void> _simulateDelay() async {
  await Future<void>.delayed(const Duration(seconds: 1));
}
