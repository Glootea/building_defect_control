// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $projectsListRoute,
  $projectReportsRoute,
  $reportDetailsRoute,
  $defectDetailsRoute,
  $authRoute,
  $profileRoute,
];

RouteBase get $projectsListRoute => GoRouteData.$route(
  path: '/projects',
  name: 'projects',
  factory: $ProjectsListRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: '/project/:projectId',
      factory: $ProjectReportsRoute._fromState,
    ),
  ],
);

mixin $ProjectsListRoute on GoRouteData {
  static ProjectsListRoute _fromState(GoRouterState state) =>
      ProjectsListRoute();

  @override
  String get location => GoRouteData.$location('/projects');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ProjectReportsRoute on GoRouteData {
  static ProjectReportsRoute _fromState(GoRouterState state) =>
      ProjectReportsRoute(
        projectId: state.pathParameters['projectId']!,
        projectName: state.uri.queryParameters['project-name']!,
      );

  ProjectReportsRoute get _self => this as ProjectReportsRoute;

  @override
  String get location => GoRouteData.$location(
    '/project/${Uri.encodeComponent(_self.projectId)}',
    queryParams: {'project-name': _self.projectName},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $projectReportsRoute => GoRouteData.$route(
  path: '/project/:projectId',
  name: 'reports',
  factory: $ProjectReportsRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: '/defect/:defectId',
      factory: $DefectDetailsRoute._fromState,
    ),
  ],
);

mixin $DefectDetailsRoute on GoRouteData {
  static DefectDetailsRoute _fromState(GoRouterState state) =>
      DefectDetailsRoute(
        defectId: state.pathParameters['defectId']!,
        defectName: state.uri.queryParameters['defect-name']!,
      );

  DefectDetailsRoute get _self => this as DefectDetailsRoute;

  @override
  String get location => GoRouteData.$location(
    '/defect/${Uri.encodeComponent(_self.defectId)}',
    queryParams: {'defect-name': _self.defectName},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $reportDetailsRoute => GoRouteData.$route(
  path: '/project/:projectId/report/:reportId',
  name: 'reportDetails',
  factory: $ReportDetailsRoute._fromState,
);

mixin $ReportDetailsRoute on GoRouteData {
  static ReportDetailsRoute _fromState(GoRouterState state) =>
      ReportDetailsRoute(
        projectId: state.pathParameters['projectId']!,
        reportId: state.pathParameters['reportId']!,
      );

  ReportDetailsRoute get _self => this as ReportDetailsRoute;

  @override
  String get location => GoRouteData.$location(
    '/project/${Uri.encodeComponent(_self.projectId)}/report/${Uri.encodeComponent(_self.reportId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $defectDetailsRoute => GoRouteData.$route(
  path: '/defect/:defectId',
  name: 'defectDetails',
  factory: $DefectDetailsRoute._fromState,
);

RouteBase get $authRoute => GoRouteData.$route(
  path: '/auth',
  name: 'auth',
  factory: $AuthRoute._fromState,
);

mixin $AuthRoute on GoRouteData {
  static AuthRoute _fromState(GoRouterState state) => const AuthRoute();

  @override
  String get location => GoRouteData.$location('/auth');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $profileRoute => GoRouteData.$route(
  path: '/profile',
  name: 'profile',
  factory: $ProfileRoute._fromState,
);

mixin $ProfileRoute on GoRouteData {
  static ProfileRoute _fromState(GoRouterState state) => const ProfileRoute();

  @override
  String get location => GoRouteData.$location('/profile');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
