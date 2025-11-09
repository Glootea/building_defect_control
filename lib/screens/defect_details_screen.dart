import 'package:control/di/di.dart';
import 'package:control/domain/defect_attachment_list/defect_attachment_list.dart';
import 'package:control/domain/defect_attachment_list/defect_attachment_list.state.dart';
import 'package:control/domain/defect_attachment_list/defect_attachment_list_query.dart';
import 'package:control/domain/defect_details/defect_details.dart';
import 'package:control/domain/defect_elimination/defect_elimination.dart';
import 'package:control/models/models.dart';
import 'package:control/utils/breadcrums.dart';
import 'package:control/utils/context_extentions.dart';
import 'package:control/utils/datetime_formatter.dart';
import 'package:control/utils/paginated_grid.dart';
import 'package:control/utils/riverpod_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DefectDetailsScreen extends HookConsumerWidget {
  final String defectId;
  final String reportId;
  final String defectName;

  const DefectDetailsScreen({
    super.key,
    required this.defectId,
    required this.defectName,
    required this.reportId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final padding = const EdgeInsets.all(16.0);
    final defectAttachmentsPane = SliverPadding(
      padding: padding,
      sliver: DefectAttachmentList(defectId: defectId, key: GlobalKey()),
    );
    final bodyContent = [
      SliverPadding(
        padding: padding,
        sliver: _DefectDetailsBody(
          defectId: defectId,
          reportId: reportId,
          key: GlobalKey(),
        ),
      ),
      SliverPadding(
        padding: padding,
        sliver: _DefectDetailsElimination(defectId, key: GlobalKey()),
      ),
    ];
    final breadcrumbs = Breadcrums(key: GlobalKey());
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return (constraints.maxWidth < 600)
              ? CustomScrollView(
                  slivers: [breadcrumbs, ...bodyContent, defectAttachmentsPane],
                )
              : CustomScrollView(
                  slivers: [
                    breadcrumbs,

                    SliverCrossAxisGroup(slivers: bodyContent),
                    defectAttachmentsPane,
                  ],
                );
        },
      ),
    );
  }
}

class _DefectDetailsBody extends HookConsumerWidget {
  final String defectId;
  final String reportId;
  const _DefectDetailsBody({
    required this.defectId,
    required this.reportId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defectState = ref.watch(
      defectDetailsProvider(defectId: defectId, reportId: reportId),
    );
    return RiverpodScreen(
      state: defectState,
      useSliver: true,
      builder: (defect) {
        return HookBuilder(
          builder: (context) {
            final defectProvider = ref.read(
              defectDetailsProvider(
                defectId: defectId,
                reportId: reportId,
              ).notifier,
            );

            final nameController = useTextEditingController(text: defect.name);
            final classificationController = useTextEditingController(
              text: defect.classification,
            );
            final descriptionController = useTextEditingController(
              text: defect.description,
            );
            final executorController = useTextEditingController();
            final executorList = useState(<String>[]);

            Future<void> fetchExecutors() async {
              final suggestions = <String>[]; // TODO: fetch from API
              executorList.value = suggestions;
            }

            useEffect(() {
              executorController.addListener(fetchExecutors);
              fetchExecutors();

              return () => executorController.removeListener(fetchExecutors);
            }, []);

            Future<void> onChangeName(String value) async {
              if (value == defect.name || value.isEmpty) return;

              await defectProvider.updateDefect(defect.copyWith(name: value));
            }

            Future<void> onChangeClassification(String value) async {
              if (value == defect.classification || value.isEmpty) return;

              await defectProvider.updateDefect(
                defect.copyWith(classification: value),
              );
            }

            Future<void> onChangeDescription(String value) async {
              if (value == defect.description || value.isEmpty) return;

              await defectProvider.updateDefect(
                defect.copyWith(description: value),
              );
            }

            final items = [
              Align(
                key: GlobalKey(),
                alignment: Alignment.centerLeft,
                child: Text(
                  context.translate.defectDetailsRouteName,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Column(
                key: GlobalKey(),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(context.translate.name),
                  TextField(
                    controller: nameController,
                    onSubmitted: (value) => onChangeName(value),
                    onTapOutside: (_) {
                      onChangeName(nameController.text);
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ],
              ),
              Column(
                key: GlobalKey(),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(context.translate.classification),
                  TextField(
                    controller: classificationController,
                    onSubmitted: (value) => onChangeClassification(value),
                    onTapOutside: (_) {
                      onChangeClassification(classificationController.text);
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(context.translate.description),
                  TextField(
                    controller: descriptionController,
                    maxLines: null,
                    onSubmitted: (value) => onChangeDescription(value),
                    onTapOutside: (_) {
                      onChangeDescription(descriptionController.text);
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(context.translate.status),
                  DropdownMenu<DefectStatus>(
                    expandedInsets: EdgeInsets.zero,
                    initialSelection: defect.status,
                    enableFilter: true,
                    onSelected: (value) {
                      if (value == null || value == defect.status) return;
                      defectProvider.updateDefect(
                        defect.copyWith(status: value),
                      );
                    },
                    dropdownMenuEntries: DefectStatus.values
                        .map((e) => DropdownMenuEntry(value: e, label: e.name))
                        .toList(),
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(context.translate.executor),
                  DropdownMenu(
                    expandedInsets: EdgeInsets.zero,
                    key: GlobalKey(),
                    enableFilter: true,
                    controller: executorController,

                    dropdownMenuEntries: executorList.value
                        .map((e) => DropdownMenuEntry(value: e, label: e))
                        .toList(),
                  ),
                ],
              ),
            ];

            return SliverList.separated(
              itemCount: items.length,
              itemBuilder: (context, index) => items[index],
              separatorBuilder: (context, index) => (index != 0)
                  ? const SizedBox(height: 8)
                  : SizedBox(height: 16),
            );
          },
        );
      },
    );
  }
}

class _DefectDetailsElimination extends HookConsumerWidget {
  final String defectId;
  const _DefectDetailsElimination(this.defectId, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eliminationProvider = ref.watch(
      defectEliminationProviderProvider(defectId),
    );
    final eliminationProviderNotifier = ref.read(
      defectEliminationProviderProvider(defectId).notifier,
    );
    return RiverpodScreen(
      useSliver: true,
      state: eliminationProvider,
      builder: (data) {
        if (data == null) {
          return SliverToBoxAdapter(
            child: Align(
              child: TextButton(
                onPressed: eliminationProviderNotifier.createDefectElimination,
                child: Text(context.translate.createElimination),
              ),
            ),
          );
        }

        final items = [
          _DefectEliminationTitleRow(
            eliminationProviderNotifier: eliminationProviderNotifier,
          ),
          _DefectEliminationStartDateButton(
            data: data,
            eliminationProviderNotifier: eliminationProviderNotifier,
          ),
          _DefectEliminationEndDateButton(
            data: data,
            eliminationProviderNotifier: eliminationProviderNotifier,
          ),
        ];
        return SliverList.separated(
          itemCount: items.length,
          itemBuilder: (context, index) => items[index],
          separatorBuilder: (context, index) =>
              (index != 0) ? const SizedBox(height: 8) : SizedBox(height: 16),
        );
      },
    );
  }
}

class _DefectEliminationTitleRow extends StatelessWidget {
  final DefectEliminationProvider eliminationProviderNotifier;

  const _DefectEliminationTitleRow({required this.eliminationProviderNotifier});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 16,
      children: [
        Text(
          context.translate.defectElimination,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        IconButton(
          onPressed: eliminationProviderNotifier.deleteDefectElimination,
          icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
        ),
      ],
    );
  }
}

class _DefectEliminationStartDateButton extends StatelessWidget {
  final DefectEliminationProvider eliminationProviderNotifier;
  final DefectElimination data;

  const _DefectEliminationStartDateButton({
    required this.eliminationProviderNotifier,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return _DefectEliminationDateRow(
      title: context.translate.startDate,
      date: data.startDate,
      onTimeSelected: (selectedDate) =>
          eliminationProviderNotifier.updateDefect(startDate: selectedDate),
      onDateSelected: (selectedDate) =>
          eliminationProviderNotifier.updateDefect(startDate: selectedDate),
    );
  }
}

class _DefectEliminationEndDateButton extends StatelessWidget {
  final DefectEliminationProvider eliminationProviderNotifier;
  final DefectElimination data;

  const _DefectEliminationEndDateButton({
    required this.eliminationProviderNotifier,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return _DefectEliminationDateRow(
      title: context.translate.endDate,
      date: data.endDate,
      onTimeSelected: (selectedDate) =>
          eliminationProviderNotifier.updateDefect(endDate: selectedDate),
      onDateSelected: (selectedDate) =>
          eliminationProviderNotifier.updateDefect(endDate: selectedDate),
    );
  }
}

class _DefectEliminationDateRow extends StatelessWidget {
  final String title;
  final DateTime date;
  final Function(DateTime selectedDate) onTimeSelected;
  final Function(DateTime selectedDate) onDateSelected;

  const _DefectEliminationDateRow({
    required this.title,
    required this.date,
    required this.onTimeSelected,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        TextButton(
          onPressed: () async {
            final time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.fromDateTime(date),
            );
            if (time == null) return;
            final newDate = date.copyWith(hour: time.hour, minute: time.minute);
            return onTimeSelected(newDate);
          },
          child: Text(date.toLocal().toShortTimeString()),
        ),
        TextButton(
          onPressed: () async {
            final now = DateTime.now();
            final selectedDate = await showDatePicker(
              context: context,
              firstDate: DateTime.fromMillisecondsSinceEpoch(0),
              lastDate: now.add(const Duration(days: 28)),
              initialDate: now,
            );
            if (selectedDate == null) return;

            final dateWithTime = selectedDate.copyWith(
              hour: date.hour,
              minute: date.minute,
            );

            return onDateSelected(dateWithTime);
          },
          child: Text(date.toLocal().toShortDateString()),
        ),
      ],
    );
  }
}

class DefectAttachmentList extends StatelessWidget {
  final String defectId;
  const DefectAttachmentList({super.key, required this.defectId});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return PaginatedGrid<DefectAttachmentListState, DefectAttachment>(
          title: context.translate.defectAttachments,
          columns: [
            context.translate.name,
            context.translate.fileSize,
            context.translate.uploadDate,
          ],
          cardBuilder: (DefectAttachment data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.fileName),
                Text('${data.fileSize} bytes'),
                Text(data.uploadDate.toLocal().toShortDateString()),
              ],
            );
          },
          tableRowBuilder: (DefectAttachment data) {
            return [
              Text(data.fileName),
              Text('${data.fileSize} bytes'),
              Text(data.uploadDate.toLocal().toShortDateString()),
            ];
          },
          dataFetcher: (WidgetRef ref, int page) => ref.watch(
            defectAttachmentListProvider(
              defectId: defectId,
              page: page,
              query: const DefectAttachmentListQuery(),
            ),
          ),
          onClick: (DefectAttachment data) {},

          onCreateNewItem: () => onCreateAttachment(ref: ref, page: 1),
          filterOverlay: null,
          resizableRowStorage: ref.watch(
            resizableRowStorageProvider('defect_attachments'),
          ),
        );
      },
    );
  }

  void onCreateAttachment({required WidgetRef ref, required int page}) {
    FilePicker.platform.pickFiles().then((result) {
      if (result == null || result.files.isEmpty) return;
      final file = result.files.first;
      ref
          .read(
            defectAttachmentListProvider(
              defectId: defectId,
              page: page,
              query: const DefectAttachmentListQuery(),
            ).notifier,
          )
          .createDefectAttachment(file);
    });
  }
}
