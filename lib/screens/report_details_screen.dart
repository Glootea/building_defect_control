import 'package:control/di/di.dart';
import 'package:control/domain/defect_list/defect_list.dart';
import 'package:control/domain/defect_list/defect_list.state.dart';
import 'package:control/domain/defect_list/defect_list_query.dart';
import 'package:control/domain/report_details/report_details.dart';
import 'package:control/models/models.dart';
import 'package:control/navigation/routes.dart';
import 'package:control/query/query.dart';
import 'package:control/query/query_mapper.dart';
import 'package:control/utils/breadcrums.dart';
import 'package:control/utils/context_extentions.dart';
import 'package:control/utils/paginated_grid.dart';
import 'package:control/utils/riverpod_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReportDetailsScreen extends StatefulWidget {
  final String projectId;
  final String reportId;

  const ReportDetailsScreen({
    required this.projectId,
    required this.reportId,
    super.key,
  });

  @override
  State<ReportDetailsScreen> createState() => _ReportDetailsScreenState();
}

class _ReportDetailsScreenState extends State<ReportDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final reportDetailsPane = ReportDetailsPane(
          projectId: widget.projectId,
          reportId: widget.reportId,
          key: GlobalKey(), // saves state when rebuilt in different layouts
        );
        final pageTitle = Text(
          context.translate.reportDetailsRouteName,
          style: Theme.of(context).textTheme.titleLarge,
          key: GlobalKey(),
        );
        final list = [DefectList(reportId: widget.reportId)];
        return Scaffold(
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 36,
                      child: CustomScrollView(
                        scrollDirection: Axis.horizontal,
                        slivers: const [Breadcrums()],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: pageTitle,
                    ),
                    Flexible(
                      child: Row(
                        spacing: 16,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: reportDetailsPane),
                          Expanded(child: CustomScrollView(slivers: list)),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return CustomScrollView(
                  slivers: [
                    const Breadcrums(),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: pageTitle,
                      ),
                    ),
                    SliverToBoxAdapter(child: reportDetailsPane),
                    ...list,
                  ],
                );
              }
            },
          ),
        );
      },
    );
  }
}

class ReportDetailsPane extends ConsumerStatefulWidget {
  final String projectId;
  final String reportId;

  const ReportDetailsPane({
    required this.projectId,
    required this.reportId,
    super.key,
  });

  @override
  ConsumerState<ReportDetailsPane> createState() => _ReportDetailsPaneState();
}

class _ReportDetailsPaneState extends ConsumerState<ReportDetailsPane> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.read(
      reportDetailsProvider(
        projectId: widget.projectId,
        reportId: widget.reportId,
      ).notifier,
    );
    return RiverpodScreen(
      state: ref.watch(
        reportDetailsProvider(
          projectId: widget.projectId,
          reportId: widget.reportId,
        ),
      ),
      builder: (data) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: HookBuilder(
            builder: (context) {
              final nameController = useTextEditingController(text: data.name);
              final descriptionController = useTextEditingController(
                text: data.description,
              );

              final submissionDate = data.submissionDate;

              final textStyle = Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600);
              final separator = const SizedBox(height: 16, width: 16);
              final reportDetailsChildren = [
                Text(context.translate.name, style: textStyle),
                TextField(
                  controller: nameController,
                  maxLines: 1,
                  onChanged: (value) =>
                      provider.updateReport(data.copyWith(name: value)),
                ),
                separator,
                Text(context.translate.description, style: textStyle),
                TextField(
                  controller: descriptionController,
                  maxLines: null,
                  onChanged: (value) =>
                      provider.updateReport(data.copyWith(description: value)),
                ),
                const SizedBox(height: 8),
                Row(
                  spacing: 8,
                  children: [
                    Icon(Icons.calendar_month_outlined),
                    Text(context.translate.submissionDate),
                    Text("${submissionDate.toLocal()}".split(' ')[0]),
                  ],
                ),
              ];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: reportDetailsChildren,
              );
            },
          ),
        );
      },
    );
  }
}

class DefectList extends StatefulWidget {
  final String reportId;

  const DefectList({super.key, required this.reportId});

  @override
  State<DefectList> createState() => _DefectListState();
}

class _DefectListState extends State<DefectList> {
  ReportListQueryState queryState = ReportListQueryState(
    name: '',
    description: '',
    classification: '',
    status: null,
  );

  void updateQueryState(
    ReportListQueryState Function(ReportListQueryState oldState) update,
  ) => setState(() => queryState = update(queryState));

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) =>
          PaginatedGrid<DefectListPageState, Defect>(
            title: context.translate.defects,
            columns: [
              context.translate.name,
              context.translate.classification,
              context.translate.status,
            ],
            tableRowBuilder: (data) => [
              Expanded(child: Text(data.name)),
              Expanded(child: Text(data.classification)),
              Expanded(child: Text(data.status.name)),
            ],

            dataFetcher: (ref, page) {
              return ref.watch(
                defectListScreenProvider(
                  page: page,
                  reportId: widget.reportId,
                  query: queryState,
                ),
              );
            },
            cardBuilder: (data) => DefectCard(defect: data),
            onClick: (data) {
              DefectDetailsRoute(
                reportId: widget.reportId,
                defectId: data.id,
                defectName: data.name,
              ).push(context);
            },
            onCreateNewItem: () {},
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
                TextQuery(
                  title: context.translate.classification,
                  value: queryState.classification,
                  onUpdate: (value) => updateQueryState(
                    (oldState) => oldState.copyWith(classification: value),
                  ),
                ),
                SelectQuery<DefectStatus?>(
                  value: queryState.status,
                  onUpdate: (value) => updateQueryState(
                    (oldState) => oldState.copyWith(status: value),
                  ),
                  title: context.translate.status,
                  options: DefectStatus.values,
                  itemLocalStringBuilder: _defectStatusLocalStringBuilder,
                ),
              ],
            ),
            resizableRowStorage: ref.watch(
              resizableRowStorageProvider('defects'),
            ),
          ),
    );
  }

  String _defectStatusLocalStringBuilder(
    BuildContext context,
    DefectStatus? status,
  ) {
    if (status == null) {
      return '';
    }
    switch (status) {
      case DefectStatus.open:
        return context.translate.open;
      case DefectStatus.inProgress:
        return context.translate.inProgress;
      case DefectStatus.resolved:
        return context.translate.resolved;
      case DefectStatus.closed:
        return context.translate.closed;
      case DefectStatus.onReview:
        return context.translate.onReview;
    }
  }
}

class DefectCard extends StatelessWidget {
  final Defect defect;
  const DefectCard({super.key, required this.defect});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8,

        children: [
          Text(defect.name, style: Theme.of(context).textTheme.titleLarge),

          Text(defect.description),
          Text("${context.translate.classification}: ${defect.classification}"),
          Text("${context.translate.status}: ${defect.status}"),
        ],
      ),
    );
  }
}
