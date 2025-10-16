import 'package:control/models/network/pagination/paginated_response.dart';
import 'package:control/models/network/pagination/pagination_query_params.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PaginatedGrid<T extends PaginatedResponse, D> extends ConsumerWidget {
  final AsyncValue<T> Function(WidgetRef ref, int page) dataFetcher;
  final Widget Function(D data) builder;
  final SliverGridDelegate gridDelegate;

  const PaginatedGrid({
    super.key,
    required this.builder,
    required this.dataFetcher,
    this.gridDelegate = const SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 200,
    ),
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
      ),

      itemBuilder: (context, index) {
        final page = index ~/ defaultPageSize + 1;
        final indexInPage = index % defaultPageSize;
        final responseAsync = dataFetcher(ref, page);

        return responseAsync.when(
          error: (err, stack) => Text(err.toString()),
          loading: () => Center(child: CircularProgressIndicator()),
          data: (response) {
            if (index >= response.metadata.totalCount) {
              return null;
            }

            if (indexInPage >= response.metadata.pageSize) {
              return null;
            }
            // TODO: handle not enough elements to fill the page -> not loading next
            final data = response.data[indexInPage];
            return builder(data);
          },
        );
      },
    );
  }
}
