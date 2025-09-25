import 'package:control/domain/projects.dart';
import 'package:control/models/models.dart';
import 'package:control/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProjectScreen extends ConsumerWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectsProvider);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Projects",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          (projects.when(
            data: (projectsList) => (projectsList.isEmpty)
                ? Center(child: Text('No Projects Found'))
                : Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                      ),
                      itemCount: projectsList.length,
                      itemBuilder: (context, index) {
                        print(projectsList);
                        final project = projectsList[index];
                        return ProjectCard(project: project);
                      },
                    ),
                  ),
            error: (error, stacktrace) => Center(child: Text('Error: $error')),
            loading: () => Center(child: CircularProgressIndicator()),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createNewProject(context, ref),
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _createNewProject(BuildContext context, WidgetRef ref) async {
    await showDialog(
      context: context,
      builder: (_) => _ProjectCreationDialog(
        onSubmitted: (name) async {
          if (name == null) return;

          final p = ref.watch(projectsProvider.notifier);
          final id = await p.createNewProject(name);
          if (!context.mounted) return;

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
