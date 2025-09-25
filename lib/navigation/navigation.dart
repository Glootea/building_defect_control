import 'package:control/screens/auth_screen.dart';
import 'package:control/screens/project_details_screen.dart';
import 'package:control/screens/project_screen.dart';
import 'package:control/screens/defect_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'navigation.g.dart';

final router = GoRouter(
  routes: $appRoutes,
  initialLocation: AuthRoute().location,
);

@TypedGoRoute<ProjectsListRoute>(
  path: '/projects',
  routes: [TypedGoRoute<ProjectDetailsRoute>(path: _projectDetailsPath)],
)
@immutable
class ProjectsListRoute extends GoRouteData with $ProjectsListRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProjectScreen();
  }
}

const String _projectDetailsPath = '/project/:projectId';

@TypedGoRoute<ProjectDetailsRoute>(
  path: _projectDetailsPath,
  routes: [TypedGoRoute<DefectDetailsRoute>(path: _defectDetailsPath)],
)
@immutable
class ProjectDetailsRoute extends GoRouteData with $ProjectDetailsRoute {
  const ProjectDetailsRoute({
    required this.projectId,
    required this.projectName,
  });

  final String projectId;
  final String projectName;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProjectDetailsScreen(projectId: projectId, projectName: projectName);
  }
}

const String _defectDetailsPath = '/defect/:defectId';

@TypedGoRoute<DefectDetailsRoute>(path: _defectDetailsPath, routes: [])
@immutable
class DefectDetailsRoute extends GoRouteData with $DefectDetailsRoute {
  const DefectDetailsRoute({required this.defectId, required this.defectName});
  final String defectId;
  final String defectName;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DefectDetailsScreen(defectId: defectId, defectName: defectName);
  }
}

@TypedGoRoute<AuthRoute>(path: '/auth', routes: [])
@immutable
class AuthRoute extends GoRouteData with $AuthRoute {
  const AuthRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AuthScreen();
  }
}
