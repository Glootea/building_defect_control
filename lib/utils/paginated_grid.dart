import 'dart:math';

import 'package:control/di/di.dart';
import 'package:control/models/network/pagination/paginated_response.dart';
import 'package:control/models/network/pagination/pagination_query_params.dart';
import 'package:control/utils/context_extentions.dart';
import 'package:control/utils/resizable_row_builder.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PaginatedGrid<PaginatedValueType extends PaginatedResponse, ValueDataType>
    extends StatefulWidget {
  final String title;
  final List<String> columns;
  final AsyncValue<PaginatedValueType> Function(WidgetRef ref, int page)
  dataFetcher;
  final Widget Function(ValueDataType data) cardBuilder;
  final List<Widget> Function(ValueDataType data) tableRowBuilder;
  final void Function(ValueDataType data) onClick;
  final void Function()? onCreateNewItem;
  final ResizableRowStorage resizableRowStorage;

  /// Has width of 300
  final Widget filterOverlay;
  final SliverGridDelegate gridDelegate;
  // TODO: onDelete with delete button

  const PaginatedGrid({
    super.key,
    required this.title,
    required this.columns,
    required this.cardBuilder,
    required this.tableRowBuilder,
    required this.dataFetcher,
    required this.onClick,
    required this.filterOverlay,
    required this.resizableRowStorage,
    this.onCreateNewItem,
    this.gridDelegate = const SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 200,
    ),
  });

  @override
  State<PaginatedGrid> createState() =>
      _PaginatedGridState<PaginatedValueType, ValueDataType>();
}

class _PaginatedGridState<
  PaginatedValueType extends PaginatedResponse,
  ValueDataType
>
    extends State<PaginatedGrid<PaginatedValueType, ValueDataType>> {
  bool? isListLayout;

  Widget? itemLoader({
    required WidgetRef ref,
    required int index,
    required Widget Function(ValueDataType data) builder,
  }) {
    final page = index ~/ defaultPageSize + 1;
    final indexInPage = index % defaultPageSize;
    final responseAsync = widget.dataFetcher(ref, page);

    return responseAsync.when(
      error: (err, stack) => Text(err.toString()),
      loading: () => null,
      data: (response) {
        if (index >= response.metadata.totalCount) {
          return null;
        }

        final data = response.data[indexInPage];

        return builder(data);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final padding = const EdgeInsets.symmetric(horizontal: 16);
    return SliverLayoutBuilder(
      builder: (context, constraints) {
        isListLayout ??= constraints.crossAxisExtent > 600;
        return Consumer(
          builder: (context, ref, child) {
            return SliverMainAxisGroup(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: padding,
                    child: Text(
                      widget.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
                SliverPadding(padding: EdgeInsets.only(top: 8)),
                _Header(
                  filterOverlay: widget.filterOverlay,
                  onCreateNewItem: widget.onCreateNewItem,
                  isListLayout: isListLayout!,
                  onLayoutChanged: (value) {
                    setState(() {
                      isListLayout = value;
                    });
                  },
                ),
                SliverPadding(
                  padding: padding,
                  sliver: isListLayout!
                      ? _ListLayout<ValueDataType>(
                          resizableRowStorage: widget.resizableRowStorage,
                          title: widget.title,
                          columns: widget.columns,
                          tableRowBuilder: widget.tableRowBuilder,
                          onClick: widget.onClick,
                          itemLoader: itemLoader,
                        )
                      : SliverGrid.builder(
                          key: GlobalKey(),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                              ),

                          itemBuilder: (context, index) {
                            return itemLoader(
                              ref: ref,
                              index: index,

                              builder: (data) => Card(
                                clipBehavior: Clip.hardEdge,
                                child: InkWell(
                                  onTap: () => widget.onClick(data),
                                  child: widget.cardBuilder(data),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class _ListLayout<ValueDataType> extends StatelessWidget {
  final ResizableRowStorage resizableRowStorage;
  final String title;
  final List<String> columns;
  final void Function(ValueDataType data) onClick;
  final Widget? Function({
    required WidgetRef ref,
    required int index,
    required Widget Function(ValueDataType) builder,
  })
  itemLoader;
  final List<Widget> Function(ValueDataType data) tableRowBuilder;

  const _ListLayout({
    super.key,
    required this.resizableRowStorage,
    required this.title,
    required this.columns,
    required this.tableRowBuilder,
    required this.onClick,
    required this.itemLoader,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: resizableRowStorage.getFractions(title),
      builder: (context, snapshot) {
        final listenables = List.generate(
          columns.length,
          (index) =>
              ValueNotifier(snapshot.data?[index] ?? (1 / columns.length)),
        );
        return Consumer(
          child: Divider(indent: 16, endIndent: 16),
          builder: (context, ref, child) {
            return SliverList.separated(
              findChildIndexCallback: (key) =>
                  key is ValueKey<String> ? int.tryParse(key.value) : null,
              separatorBuilder: (context, index) =>
                  Divider(indent: 16, endIndent: 16),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return ResizableRowBuilder(
                    key: ValueKey(index.toString()),
                    id: title,
                    storage: ref.watch(resizableRowStorageProvider(title)),
                    onTap: null,
                    listenables: listenables,
                    children: columns
                        .map(
                          (e) => Text(
                            e,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        )
                        .toList(),
                    onResize: () => resizableRowStorage.setFractions(
                      title,
                      listenables.map((e) => e.value).toList(),
                    ),
                  );
                }
                return itemLoader(
                  ref: ref,
                  index: index - 1,

                  builder: (data) => ResizableRowBuilder(
                    key: ValueKey(index.toString()),
                    id: title,
                    storage: resizableRowStorage,
                    onTap: () => onClick(data),
                    listenables: listenables,
                    children: tableRowBuilder(data),
                    onResize: () => resizableRowStorage.setFractions(
                      title,
                      listenables.map((e) => e.value).toList(),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  final EdgeInsets padding = const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 8,
  );
  final Widget filterOverlay;
  final void Function()? onCreateNewItem;

  final bool isListLayout;
  final void Function(bool isListLayout) onLayoutChanged;
  const _Header({
    required this.filterOverlay,
    required this.onCreateNewItem,
    required this.isListLayout,
    required this.onLayoutChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SliverCrossAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: _ViewSelectionToggle(
                    isListLayout: isListLayout,
                    onLayoutChanged: (value) => onLayoutChanged(value),
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _FilterButton(filterOverlay: filterOverlay),
                      if (onCreateNewItem != null)
                        Flexible(
                          child: FilledButton.icon(
                            onPressed: onCreateNewItem,
                            label: Text(
                              context.translate.createNew,
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                            ),
                            iconAlignment: IconAlignment.end,
                            icon: Icon(Icons.add_outlined),
                            style: ButtonStyle(
                              padding: WidgetStatePropertyAll(
                                const EdgeInsets.all(12),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _FilterButton extends StatelessWidget {
  final Widget filterOverlay;
  final OverlayPortalController _tooltipController = OverlayPortalController();

  _FilterButton({required this.filterOverlay});

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: _tooltipController,
      overlayChildBuilder: (_) {
        final targetRenderBox = context.findRenderObject() as RenderBox?;
        if (targetRenderBox == null) {
          return SizedBox.shrink();
        }

        final position = targetRenderBox.localToGlobal(Offset.zero);
        final screenSize = MediaQuery.sizeOf(context);
        final remainingWidth =
            screenSize.width - position.dx - targetRenderBox.size.width;

        return Positioned(
          right: remainingWidth > 16 ? 16 : remainingWidth,
          top: position.dy + targetRenderBox.size.height,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: min(screenSize.width - 32, 300),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(16),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 4,
                    // offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: filterOverlay,
              ),
            ),
          ),
        );
      },
      child: IconButton(
        onPressed: () => _tooltipController.toggle(),
        icon: Icon(Icons.filter_list_outlined),
      ),
    );
  }
}

class _ViewSelectionToggle extends StatelessWidget {
  final bool isListLayout;
  final void Function(bool isListLayout) onLayoutChanged;

  const _ViewSelectionToggle({
    required this.isListLayout,
    required this.onLayoutChanged,
  });

  @override
  Widget build(BuildContext context) {
    final foregroundColor = Theme.of(context).textTheme.bodyLarge?.color;
    final buttonTheme = ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(foregroundColor),

      shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
    );

    ButtonStyle mapButtonStyle(bool isListButton) {
      return isListButton == isListLayout
          ? buttonTheme
          : buttonTheme.copyWith(
              foregroundColor: WidgetStatePropertyAll(
                foregroundColor?.withValues(alpha: 0.6),
              ),
            );
    }

    return Row(
      children: [
        Flexible(
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: (isListLayout)
                  ? Border(bottom: BorderSide(color: Colors.black))
                  : null,
            ),
            child: TextButton.icon(
              onPressed: () => onLayoutChanged(true),
              icon: Icon(Icons.view_list_outlined),
              label: Text(
                context.translate.listView,
                overflow: TextOverflow.clip,
                maxLines: 1,
              ),
              style: mapButtonStyle(true),
            ),
          ),
        ),
        Flexible(
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: (!isListLayout)
                  ? Border(bottom: BorderSide(color: Colors.black))
                  : null,
            ),
            child: TextButton.icon(
              onPressed: () => onLayoutChanged(false),
              icon: Icon(Icons.view_module_outlined),
              label: Text(
                context.translate.gridView,
                overflow: TextOverflow.clip,
                maxLines: 1,
              ),
              style: mapButtonStyle(false),
            ),
          ),
        ),
      ],
    );
  }
}
