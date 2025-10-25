import 'package:control/screens/auth_screen.dart';
import 'package:control/screens/profile_screen.dart';
import 'package:control/screens/report_details_screen.dart';
import 'package:control/screens/reports_screen.dart';
import 'package:control/screens/project_list_screen.dart';
import 'package:control/screens/defect_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'navigation.g.dart';

@TypedGoRoute<ProjectsListRoute>(
  path: '/projects',
  routes: [TypedGoRoute<ProjectReportsRoute>(path: _projectDetailsPath)],
)
@immutable
class ProjectsListRoute extends GoRouteData with $ProjectsListRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProjectListScreen();
  }
}

const String _projectDetailsPath = '/project/:projectId';

@TypedGoRoute<ProjectReportsRoute>(
  path: _projectDetailsPath,
  routes: [TypedGoRoute<DefectDetailsRoute>(path: _defectDetailsPath)],
)
@immutable
class ProjectReportsRoute extends GoRouteData with $ProjectReportsRoute {
  const ProjectReportsRoute({
    required this.projectId,
    required this.projectName,
  });

  final String projectId;
  final String projectName;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ReportListScreen(projectId: projectId, projectName: projectName);
  }
}

const String _reportDetails = '/project/:projectId/report/:reportId';

@TypedGoRoute<ReportDetailsRoute>(path: _reportDetails, routes: [])
@immutable
class ReportDetailsRoute extends GoRouteData with $ReportDetailsRoute {
  const ReportDetailsRoute({required this.projectId, required this.reportId});
  final String projectId;
  final String reportId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ReportDetailsScreen(projectId: projectId, reportId: reportId);
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
    return const AuthScreen();
  }
}

@TypedGoRoute<ProfileRoute>(path: '/profile', routes: [])
@immutable
class ProfileRoute extends GoRouteData with $ProfileRoute {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProfileScreen();
  }
}
