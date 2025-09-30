import 'package:movie_magic/core/core.dart';
import 'package:movie_magic/features/movie/data/models/paginated_result_model.dart';
import 'package:movie_magic/features/pagination/pagination_index.dart';

class PaginatedBuilder<T, P> extends StatefulHookWidget {
  const PaginatedBuilder({
    required this.useCase,
    required this.params,
    required this.items,
    required this.itemBuilder,
    super.key,
    this.separatorBuilder,
    this.onResultLoaded,
    this.initCallback,
    this.totalPages,
    this.shouldPaginate = true,
  });
  final UseCase<PaginatedResult<T>, P> useCase;
  final P Function(int) params;
  final List<T> items;
  final int? totalPages;
  final Widget Function(T) itemBuilder;
  final Widget Function(BuildContext, int)? separatorBuilder;
  final ValueChanged<List<T>>? onResultLoaded;
  final VoidCallback? initCallback;
  final bool shouldPaginate;

  @override
  State<PaginatedBuilder<T, P>> createState() => _PaginatedBuilderState<T, P>();
}

class _PaginatedBuilderState<T, P> extends State<PaginatedBuilder<T, P>> {
  late PaginationBloc<T, P> paginationBloc;
  int page = 1;

  @override
  void initState() {
    super.initState();
    widget.initCallback?.call();
    paginationBloc = PaginationBloc(useCase: widget.useCase);
  }

  @override
  void dispose() {
    paginationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final paginationItems = useState(widget.items);
    return BlocConsumer(
      bloc: paginationBloc,
      listener: (context, state) {
        if (state is PaginationResultLoaded<T> && state.i.results.isNotEmpty) {
          page = state.i.page;
          if (!paginationItems.value.contains(state.i.results.last)) {
            if (widget.onResultLoaded != null) {
              widget.onResultLoaded?.call(state.i.results);
            } else {
              final addedItems = state.i.results..removeAt(0);
              paginationItems.value.addAll(addedItems);
            }
          }
        }
      },
      builder: (context, state) {
        return PaginatedGrid<T>(
          itemBuilder: widget.itemBuilder,
          isLoading: state is PaginationLoading,
          items: paginationItems.value,
          loadCallback: () {
            final totalPages = widget.totalPages ?? 0;
            if (widget.shouldPaginate &&
                page < totalPages &&
                state is! PaginationLoading) {
              final params = widget.params.call(page + 1);
              paginationBloc.add(FetchPaginatedResult(params));
            }
          },
        );
      },
    );
  }
}
