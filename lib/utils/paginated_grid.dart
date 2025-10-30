import 'dart:math';

import 'package:control/models/network/pagination/paginated_response.dart';
import 'package:control/models/network/pagination/pagination_query_params.dart';
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

  /// Has width of 300
  final Widget filterOverlay;
  final SliverGridDelegate gridDelegate;

  const PaginatedGrid({
    super.key,
    required this.title,
    required this.columns,
    required this.cardBuilder,
    required this.tableRowBuilder,
    required this.dataFetcher,
    required this.onClick,
    required this.filterOverlay,
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
  bool isListLayout = true;

  @override
  Widget build(BuildContext context) {
    final padding = const EdgeInsets.symmetric(horizontal: 16);
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
            SliverCrossAxisGroup(
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
                            onLayoutChanged: (value) => setState(() {
                              isListLayout = value;
                            }),
                          ),
                        ),
                        Flexible(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _FilterButton(
                                filterOverlay: widget.filterOverlay,
                              ),
                              if (widget.onCreateNewItem != null)
                                Flexible(
                                  child: FilledButton.icon(
                                    onPressed: widget.onCreateNewItem,
                                    label: const Text(
                                      'New',
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
            ),
            isListLayout
                ? SliverList.separated(
                    separatorBuilder: (context, index) =>
                        Divider(indent: 16, endIndent: 16),
                    itemBuilder: (context, index) {
                      final page = index ~/ defaultPageSize + 1;
                      final indexInPage = index % defaultPageSize;
                      final responseAsync = widget.dataFetcher(ref, page);

                      return responseAsync.when(
                        error: (err, stack) => Text(err.toString()),
                        loading: () => const SizedBox(height: 100, width: 100),
                        data: (response) {
                          if (index >= response.metadata.totalCount) {
                            return null;
                          }

                          // TODO: handle not enough elements to fill the page -> not loading next
                          final data = response.data[indexInPage];

                          return SliverCrossAxisExpanded(
                            flex: 1,
                            sliver: ResizableRowBuilder(
                              id: widget.title,
                              storage: InMemoryResizableRowStorage(),
                              onTap: () => widget.onClick(data),
                              children: widget.tableRowBuilder(data),
                            ),
                          );
                        },
                      );
                    },
                    key: GlobalKey(),
                  )
                : SliverGrid.builder(
                    key: GlobalKey(),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                    ),

                    itemBuilder: (context, index) {
                      final page = index ~/ defaultPageSize + 1;
                      final indexInPage = index % defaultPageSize;
                      final responseAsync = widget.dataFetcher(ref, page);

                      return responseAsync.when(
                        error: (err, stack) => Text(err.toString()),
                        loading: () => const SizedBox(height: 100, width: 100),
                        data: (response) {
                          if (index >= response.metadata.totalCount) {
                            return null;
                          }

                          // TODO: handle not enough elements to fill the page -> not loading next
                          final data = response.data[indexInPage];

                          return Card(
                            clipBehavior: Clip.hardEdge,
                            child: InkWell(
                              onTap: () => widget.onClick(data),
                              child: widget.cardBuilder(data),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ],
        );
      },
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
                "List View",
                overflow: TextOverflow.ellipsis,
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
                "Grid View",
                overflow: TextOverflow.ellipsis,
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
