part of 'pagination_bloc.dart';

@immutable
sealed class PaginationState {}

final class PaginationInitial extends PaginationState {}

final class PaginationLoading extends PaginationState {}

final class PaginationResultLoaded<T> extends PaginationState {
  PaginationResultLoaded(this.i);
  final PaginatedResult<T> i;
}

final class PaginationError extends PaginationState {
  PaginationError(this.error);
  final ErrorResponse error;
}
