import 'package:control/domain/project_details.dart';
import 'package:control/models/models.dart';
import 'package:control/navigation/navigation.dart';
import 'package:control/utils/object_name_textfield_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProjectDetailsScreen extends HookConsumerWidget {
  final String projectId;
  final String projectName;
  const ProjectDetailsScreen({
    super.key,
    required this.projectId,
    required this.projectName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> onProjectNameSubmitted(String value) async {
      if (value == projectName || value.isEmpty) return;

      await ref
          .read(projectDetailsProvider(projectId).notifier)
          .saveProjectName(projectId, value);
    }

    final project = ref.watch(projectDetailsProvider(projectId));
    final controller = useTextEditingController(text: projectName);

    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: projectId,
          child: Material(
            type: MaterialType.transparency,
            child: TextField(
              controller: controller,
              decoration: objectNameTextFieldDecoration,
              onSubmitted: onProjectNameSubmitted,
              onTapOutside: (_) {
                onProjectNameSubmitted(controller.text);
                FocusScope.of(context).unfocus();
              },
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Defects",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          project.when(
            data: (defects) {
              final defects = project.requireValue.defects;
              return Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                  ),
                  itemCount: defects.length,
                  itemBuilder: (context, index) {
                    final defect = defects[index];
                    return DefectCard(defect: defect);
                  },
                ),
              );
            },
            error: (error, stacktrace) => Center(child: Text('Error: $error')),
            loading: () => Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}

class DefectCard extends StatelessWidget {
  const DefectCard({super.key, required this.defect});

  final Defect defect;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => DefectDetailsRoute(
          defectId: defect.id,
          defectName: defect.name,
        ).push(context),
        child: ListTile(
          title: Hero(
            tag: defect.id,
            child: Material(
              type: MaterialType.transparency,
              child: Text(defect.name),
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(defect.classification), Text(defect.description)],
          ),
        ),
      ),
    );
  }
}
