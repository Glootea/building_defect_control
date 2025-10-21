import 'package:control/domain/page_logic/project_list_screen.dart';
import 'package:control/domain/user.dart';
import 'package:control/models/models.dart';
import 'package:control/navigation/navigation.dart';
import 'package:control/utils/collapsing_searchbar.dart';
import 'package:control/utils/paginated_grid.dart';
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
      appBar: AppBar(
        title: Row(
          children: [
            Text("Projects", style: Theme.of(context).textTheme.headlineMedium),
            CollapsingSearchbar(
              onChanged: (query) {
                setState(() {
                  currentQuery = query;
                });
              },
            ),
          ],
        ),
        actions: [
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
      body: PaginatedGrid<ProjectListPageState, ProjectShallow>(
        dataFetcher: (ref, page) {
          currentPage = page;
          return ref.watch(projectListScreenProvider(page, currentQuery));
        },
        builder: (data) => ProjectCard(project: data, key: ObjectKey(data.id)),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            _createNewProject(context, ref, currentPage, currentQuery),
        child: Icon(Icons.add),
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
              .watch(projectListScreenProvider(page, currentQuery).notifier)
              .createProject(name);

          if (!context.mounted || id == null) return;

          ProjectDetailsRoute(projectId: id, projectName: name).push(context);
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
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => ProjectDetailsRoute(
          projectId: project.id,
          projectName: project.name,
        ).push(context),
        child: ListTile(
          title: Hero(
            tag: project.id,
            child: Material(
              type: MaterialType.transparency,
              child: Text(project.name),
            ),
          ),
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
