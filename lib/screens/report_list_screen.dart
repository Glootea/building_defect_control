import 'package:control/di/di.dart';
import 'package:control/domain/project_details/project_details.dart';
import 'package:control/domain/report_list/report_list.dart';
import 'package:control/domain/report_list/report_list.state.dart';
import 'package:control/domain/report_list/report_list_query.dart';
import 'package:control/models/models.dart';
import 'package:control/navigation/routes.dart';
import 'package:control/query/query.dart';
import 'package:control/query/query_mapper.dart';
import 'package:control/utils/breadcrums.dart';
import 'package:control/utils/context_extentions.dart';
import 'package:control/utils/datetime_formatter.dart';
import 'package:control/utils/paginated_grid.dart';
import 'package:control/utils/riverpod_screen.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReportListScreen extends ConsumerStatefulWidget {
  final String projectId;
  final String projectName;
  const ReportListScreen({
    required this.projectId,
    required this.projectName,
    super.key,
  });

  @override
  ConsumerState<ReportListScreen> createState() => _ProjectListScreenState();
}

class _ProjectListScreenState extends ConsumerState<ReportListScreen> {
  int currentPage = 1;
  ReportListQueryState queryState = ReportListQueryState(
    name: '',
    description: '',
  );
  void updateQueryState(
    ReportListQueryState Function(ReportListQueryState oldState) update,
  ) => setState(() => queryState = update(queryState));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const Breadcrums(),
          ProjectEditPane(
            projectId: widget.projectId,
            initialName: widget.projectName,
          ),
          PaginatedGrid<ReportListState, Report>(
            title: context.translate.reportsRouteName,

            dataFetcher: (ref, page) {
              currentPage = page;
              return ref.watch(
                reportListProvider(widget.projectId, page, queryState),
              );
            },
            columns: [
              context.translate.name,
              context.translate.submissionDate,
              context.translate.description,
            ],
            cardBuilder: (data) => ReportCard(
              report: data,
              projectId: widget.projectId,
              key: ObjectKey(data.id),
            ),
            tableRowBuilder: (data) => [
              Text(data.name),
              Text(data.submissionDate.toShortDateString()),
              Text(data.description),
            ],

            onClick: (data) {
              ReportDetailsRoute(
                projectId: widget.projectId,
                reportId: data.id,
              ).push(context);
            },
            onCreateNewItem: () => _createNewDefect(
              context,
              ref,
              widget.projectId,
              currentPage,
              queryState,
            ),

            filterOverlay: QueryDialogBuilder(
              queries: [
                TextQuery(
                  title: context.translate.name,
                  value: queryState.name,
                  onUpdate: (value) => updateQueryState(
                    (oldState) => oldState.copyWith(name: value),
                  ),
                ),
                TextQuery(
                  title: context.translate.description,
                  value: queryState.description,
                  onUpdate: (value) => updateQueryState(
                    (oldState) => oldState.copyWith(description: value),
                  ),
                ),
              ],
            ),
            resizableRowStorage: ref.watch(
              resizableRowStorageProvider('reports'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _createNewDefect(
    BuildContext context,
    WidgetRef ref,
    String projectId,
    int page,
    ReportListQueryState queryState,
  ) async {
    await showDialog(
      context: context,
      builder: (_) => _ReportCreationDialog(
        onSubmitted: (name, description) async {
          if (name == null || description == null) return;

          final createdReportId = await ref
              .watch(reportListProvider(projectId, page, queryState).notifier)
              .createReport(name, description);

          if (!context.mounted || createdReportId == null) return;

          ReportDetailsRoute(
            projectId: projectId,
            reportId: createdReportId,
          ).push(context);
        },
      ),
    );
  }
}

class ProjectEditPane extends StatefulWidget {
  final String projectId;
  final String initialName;
  const ProjectEditPane({
    super.key,
    required this.projectId,
    required this.initialName,
  });

  @override
  State<ProjectEditPane> createState() => _ProjectEditPaneState();
}

class _ProjectEditPaneState extends State<ProjectEditPane> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.initialName,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) => RiverpodScreen(
        useSliver: true,
        state: ref.watch(projectDetailsProvider(projectId: widget.projectId)),
        builder: (data) {
          return SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverToBoxAdapter(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: context.translate.name),
                onChanged: (value) {
                  final updatedProject = data.copyWith(name: value);
                  ref
                      .read(
                        projectDetailsProvider(
                          projectId: widget.projectId,
                        ).notifier,
                      )
                      .updateProject(updatedProject);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  const ReportCard({super.key, required this.report, required this.projectId});

  final Report report;
  final String projectId;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Hero(
        tag: report.id,
        child: Material(
          type: MaterialType.transparency,
          child: Text(
            report.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 8,
            children: [
              Icon(Icons.calendar_month_outlined),
              Text(report.submissionDate.toShortDateString()),
            ],
          ),
          Text(report.description),
        ],
      ),
    );
  }
}

class _ReportCreationDialog extends StatefulWidget {
  final Future<void> Function(String? name, String? description) onSubmitted;
  const _ReportCreationDialog({required this.onSubmitted});

  @override
  State<_ReportCreationDialog> createState() => _ReportCreationDialogState();
}

class _ReportCreationDialogState extends State<_ReportCreationDialog> {
  String name = '';
  String description = '';
  bool isLoading = false;

  late final nameFocusNode = FocusNode();
  late final descriptionFocusNode = FocusNode();
  late final createButtonFocusNode = FocusNode();

  @override
  void dispose() {
    nameFocusNode.dispose();
    descriptionFocusNode.dispose();
    createButtonFocusNode.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    await widget.onSubmitted(name, description);
    if (!context.mounted) return;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: Text(context.translate.createNewReport),
      content: AnimatedSize(
        duration: const Duration(milliseconds: 300),

        child: (isLoading)
            ? SizedBox(
                height: 100,
                width: 100,
                child: Center(child: CircularProgressIndicator()),
              )
            : Column(
                spacing: 16,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    autofocus: true,
                    focusNode: nameFocusNode,
                    decoration: InputDecoration(
                      hintText: context.translate.enterReportName,
                      contentPadding: EdgeInsets.all(16),
                    ),
                    onChanged: (value) async {
                      name = value;
                    },
                    onSubmitted: (value) => descriptionFocusNode.requestFocus(),
                  ),
                  TextField(
                    focusNode: descriptionFocusNode,
                    decoration: InputDecoration(
                      hintText: context.translate.enterReportDescription,
                      contentPadding: EdgeInsets.all(16),
                    ),
                    onChanged: (value) async {
                      description = value;
                    },
                    onSubmitted: (_) => _handleSubmit(context),
                  ),
                ],
              ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (!context.mounted) return;
            Navigator.of(context).pop();
          },
          child: Text(context.translate.cancel),
        ),
        FilledButton(
          onPressed: () => _handleSubmit(context),
          child: Text(context.translate.create),
        ),
      ],
    );
  }
}
