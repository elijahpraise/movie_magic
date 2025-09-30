import 'package:movie_magic/core/core.dart';
import 'package:movie_magic/features/movie/movie_index.dart';

part 'pagination_event.dart';
part 'pagination_state.dart';

class PaginationBloc<T, P> extends Bloc<PaginationEvent, PaginationState> {
  PaginationBloc({required this.useCase}) : super(PaginationInitial()) {
    on<FetchPaginatedResult<P>>(_fetchResult);
  }
  final UseCase<PaginatedResult<T>, P> useCase;

  Future<void> _fetchResult(
    FetchPaginatedResult<P> event,
    Emitter<PaginationState> emit,
  ) async {
    emit(PaginationLoading());
    final res = await useCase.call(event.params);
    res.fold(
      (l) => emit(PaginationResultLoaded(l)),
      (r) => emit(PaginationError(r)),
    );
  }
}
