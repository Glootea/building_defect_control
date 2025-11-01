import 'package:control/domain/data_logic/defects.dart';
import 'package:control/domain/data_logic/reports.dart';
import 'package:control/models/models.dart';
import 'package:control/models/network/defect/get_defects_by_report_id.dart';
import 'package:control/utils/breadcrums.dart';
import 'package:control/utils/context_extentions.dart';
import 'package:control/utils/paginated_grid.dart';
import 'package:control/utils/resizable_row_builder.dart';
import 'package:control/utils/riverpod_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReportDetailsScreen extends StatelessWidget {
  final String projectId;
  final String reportId;

  const ReportDetailsScreen({
    required this.projectId,
    required this.reportId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final reportDetailsPane = ReportDetailsPane(
      projectId: projectId,
      reportId: reportId,
      key: GlobalKey(), // saves state when rebuilt in different layouts
    );
    final list = [
      SliverToBoxAdapter(
        child: Text(
          context.translate.reportDetailsRouteName,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      PaginatedGrid<GetDefectsByReportIdResponse, Defect>(
        title: context.translate.reportDetailsRouteName,
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

        dataFetcher: (ref, page) =>
            ref.watch(getDefectsProvider(page, reportId: reportId)),
        cardBuilder: (data) => DefectCard(defect: data),
        onClick: (data) {},
        onCreateNewItem: () {},
        filterOverlay: Column(children: [TextField()]),
        resizableRowStorage: InMemoryResizableRowStorage(),
        key: GlobalKey(),
      ),
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 32,
                    child: CustomScrollView(
                      scrollDirection: Axis.horizontal,
                      slivers: const [Breadcrums()],
                    ),
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
                  SliverToBoxAdapter(child: reportDetailsPane),
                  ...list,
                ],
              );
            }
          },
        ),
      ),
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
  ConsumerState<ReportDetailsPane> createState() => _ReportDetailsScreenState();
}

class _ReportDetailsScreenState extends ConsumerState<ReportDetailsPane> {
  @override
  Widget build(BuildContext context) {
    return RiverpodScreen(
      state: ref.watch(
        getReportByIdProvider(widget.projectId, widget.reportId),
      ),
      child: (data) {
        return HookBuilder(
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
              Text(
                context.translate.reportDetailsRouteName,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 16),
              Text(context.translate.name, style: textStyle),
              TextField(controller: nameController, maxLines: 1),
              separator,
              Text(context.translate.description, style: textStyle),
              TextField(controller: descriptionController, maxLines: null),
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
        );
      },
    );
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
