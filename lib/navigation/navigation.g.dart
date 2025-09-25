// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $projectsListRoute,
  $projectDetailsRoute,
  $defectDetailsRoute,
  $authRoute,
];

RouteBase get $projectsListRoute => GoRouteData.$route(
  path: '/projects',
  factory: $ProjectsListRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: '/project/:projectId',
      factory: $ProjectDetailsRoute._fromState,
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

mixin $ProjectDetailsRoute on GoRouteData {
  static ProjectDetailsRoute _fromState(GoRouterState state) =>
      ProjectDetailsRoute(
        projectId: state.pathParameters['projectId']!,
        projectName: state.uri.queryParameters['project-name']!,
      );

  ProjectDetailsRoute get _self => this as ProjectDetailsRoute;

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

RouteBase get $projectDetailsRoute => GoRouteData.$route(
  path: '/project/:projectId',
  factory: $ProjectDetailsRoute._fromState,
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

RouteBase get $defectDetailsRoute => GoRouteData.$route(
  path: '/defect/:defectId',
  factory: $DefectDetailsRoute._fromState,
);

RouteBase get $authRoute =>
    GoRouteData.$route(path: '/auth', factory: $AuthRoute._fromState);

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
