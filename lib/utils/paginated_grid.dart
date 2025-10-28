import 'package:control/models/network/pagination/paginated_response.dart';
import 'package:control/models/network/pagination/pagination_query_params.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PaginatedGrid<PaginatedValueType extends PaginatedResponse, ValueDataType>
    extends StatefulWidget {
  final String title;
  final List<String> columns;
  final AsyncValue<PaginatedValueType> Function(WidgetRef ref, int page)
  dataFetcher;
  final Widget Function(ValueDataType data) cardBuilder;
  final Widget Function(ValueDataType data) tableRowBuilder;
  final void Function(ValueDataType data) onClick;
  final SliverGridDelegate gridDelegate;

  const PaginatedGrid({
    super.key,
    required this.title,
    required this.columns,
    required this.cardBuilder,
    required this.tableRowBuilder,
    required this.dataFetcher,
    required this.onClick,
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
    return Consumer(
      builder: (context, ref, child) {
        return SliverMainAxisGroup(
          slivers: [
            SliverToBoxAdapter(
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(top: 8)),
            SliverCrossAxisGroup(
              slivers: [
                SliverToBoxAdapter(
                  child: _ViewSelectionToggle(
                    isListLayout: isListLayout,
                    onLayoutChanged: (value) => setState(() {
                      isListLayout = value;
                    }),
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

                          return ListTile(
                            onTap: () => widget.onClick(data),
                            title: widget.tableRowBuilder(data),
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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            border: (isListLayout)
                ? Border(bottom: BorderSide(color: Colors.black))
                : null,
          ),
          child: TextButton.icon(
            onPressed: () => onLayoutChanged(true),
            icon: Icon(Icons.view_list_outlined),
            label: Text("List View"),
            style: mapButtonStyle(true),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            border: (!isListLayout)
                ? Border(bottom: BorderSide(color: Colors.black))
                : null,
          ),
          child: TextButton.icon(
            onPressed: () => onLayoutChanged(false),
            icon: Icon(Icons.view_module_outlined),
            label: Text("Grid View"),
            style: mapButtonStyle(false),
          ),
        ),
      ],
    );
  }
}
