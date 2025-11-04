import 'package:control/domain/project_list/project_list.dart';
import 'package:control/domain/project_list/project_list.state.dart';
import 'package:control/domain/user/user.dart';
import 'package:control/models/models.dart';
import 'package:control/navigation/routes.dart';
import 'package:control/utils/breadcrums.dart';
import 'package:control/utils/context_extentions.dart';
import 'package:control/utils/paginated_grid.dart';
import 'package:control/utils/resizable_row_builder.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProjectListScreen extends ConsumerStatefulWidget {
  const ProjectListScreen({super.key});

  @override
  ConsumerState<ProjectListScreen> createState() => _ProjectListScreenState();
}

class _ProjectListScreenState extends ConsumerState<ProjectListScreen> {
  int currentPage = 1;
  String currentQuery = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverCrossAxisGroup(
            slivers: [
              const Breadcrums(),

              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        ProfileRoute().push(context);
                      },
                      icon: Icon(Icons.person_outline),
                    ),
                    IconButton(
                      onPressed: () {
                        ref.read(userProvider.notifier).clearUser();
                      },
                      icon: Icon(Icons.logout),
                    ),
                  ],
                ),
              ),
            ],
          ),
          PaginatedGrid<ProjectListState, ProjectShallow>(
            title: context.translate.projectRouteName,
            dataFetcher: (ref, page) {
              currentPage = page;
              return ref.watch(projectListProvider(page, currentQuery));
            },
            cardBuilder: (data) =>
                ProjectCard(project: data, key: ObjectKey(data.id)),
            columns: [context.translate.name],
            tableRowBuilder: (data) => [Text(data.name)],

            onClick: (project) => ProjectReportsRoute(
              projectId: project.id,
              projectName: project.name,
            ).push(context),
            onCreateNewItem: () =>
                _createNewProject(context, ref, currentPage, currentQuery),
            filterOverlay: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(context.translate.name), TextField()],
            ),
            resizableRowStorage: InMemoryResizableRowStorage(),
          ),
        ],
      ),
    );
  }

  Future<void> _createNewProject(
    BuildContext context,
    WidgetRef ref,
    int page,
    String currentQuery,
  ) async {
    await showDialog(
      context: context,
      builder: (_) => _ProjectCreationDialog(
        onSubmitted: (name) async {
          if (name == null) return;

          final id = await ref
              .watch(projectListProvider(page, currentQuery).notifier)
              .createProject(name);

          if (!context.mounted || id == null) return;

          ProjectReportsRoute(projectId: id, projectName: name).push(context);
        },
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final ProjectShallow project;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Hero(
        tag: project.id,
        child: Material(
          type: MaterialType.transparency,
          child: Text(project.name),
        ),
      ),
    );
  }
}

class _ProjectCreationDialog extends StatefulWidget {
  final Future<void> Function(String?) onSubmitted;
  const _ProjectCreationDialog({required this.onSubmitted});

  @override
  State<_ProjectCreationDialog> createState() => _ProjectCreationDialogState();
}

class _ProjectCreationDialogState extends State<_ProjectCreationDialog> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        child: (isLoading)
            ? SizedBox(
                height: 100,
                width: 100,
                child: Center(child: CircularProgressIndicator()),
              )
            : TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Enter project name',
                  contentPadding: EdgeInsets.all(16),
                ),
                onSubmitted: (value) async {
                  setState(() {
                    isLoading = true;
                  });

                  await widget.onSubmitted(value);

                  if (!context.mounted) return;
                  Navigator.of(context).pop();
                },
              ),
      ),
    );
  }
}
