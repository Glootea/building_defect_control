import 'package:control/domain/page_logic/report_list_screen.dart';
import 'package:control/models/models.dart';
import 'package:control/navigation/navigation.dart';
import 'package:control/utils/collapsing_searchbar.dart';
import 'package:control/utils/datetime_formatter.dart';
import 'package:control/utils/paginated_grid.dart';
import 'package:control/utils/resizable_row_builder.dart';

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
  String currentQuery = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Reports of ${widget.projectName}",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            CollapsingSearchbar(
              onChanged: (query) {
                setState(() {
                  currentQuery = query;
                });
              },
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          PaginatedGrid<ReportListPageState, Report>(
            title: 'Reports',

            dataFetcher: (ref, page) {
              currentPage = page;
              return ref.watch(
                reportListScreenProvider(widget.projectId, page, currentQuery),
              );
            },
            columns: [
              'Name',
              'Submission Date',
              'Description',
              'Col 4',
              'Col 5',
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
              Text('Sample'),
              Text('Test'),
            ],

            onClick: (data) => () {
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
              currentQuery,
            ),
            filterOverlay: Column(children: [TextField()]),
            resizableRowStorage: InMemoryResizableRowStorage(),
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
    String currentQuery,
  ) async {
    await showDialog(
      context: context,
      builder: (_) => _ReportCreationDialog(
        onSubmitted: (name, description) async {
          if (name == null || description == null) return;

          final createdReportId = await ref
              .watch(
                reportListScreenProvider(
                  projectId,
                  page,
                  currentQuery,
                ).notifier,
              )
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
      title: Text('Create New Report'),
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
                      hintText: 'Enter report name',
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
                      hintText: 'Enter report description',
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
          child: Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => _handleSubmit(context),
          child: Text('Create'),
        ),
      ],
    );
  }
}
