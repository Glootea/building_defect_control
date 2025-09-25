import 'package:control/models/models.dart';
import 'package:uuid/uuid.dart';

abstract interface class IDataProvider {
  Future<List<ProjectShallow>> getProjects();
  Future<ProjectShallow> createProject(String name);
  Future<Project> getProject(String projectId);
  Future<List<Defect>> getDefects(String projectId);
  Future<Project> updateProject(Project project);
  Future<Defect> getDefect(String defectId);
  Future<Defect> updateDefect(Defect defect);
}

extension UuidX on Uuid {
  String generate() => v7();
}
