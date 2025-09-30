import 'package:dartz/dartz.dart';
import 'package:movie_magic/core/core.dart';
import 'package:movie_magic/features/movie/movie_index.dart';

/* Discover Movie Use Case */
final discoverMovieUseCase = DiscoverMovieUseCase();

class DiscoverMovieUseCase
    extends UseCase<PaginatedResult<Movie>, DiscoverMovieParams> {
  @override
  Future<Either<PaginatedResult<Movie>, ErrorResponse>> call(
    DiscoverMovieParams params,
  ) async {
    final res = await movieRepository.discoverMovies(params);
    return res.fold(Left.new, Right.new);
  }
}

/* Movie Genre Use Case */
final movieGenreUseCase = MovieGenreUseCase();

class MovieGenreUseCase extends UseCase<List<Genre>, void> {
  @override
  Future<Either<List<Genre>, ErrorResponse>> call(void params) async {
    final res = await movieRepository.getMovieGenres();
    return res.fold(Left.new, Right.new);
  }
}

/* Movie Detail Use Case */
final movieDetailUseCase = MovieDetailUseCase();

class MovieDetailUseCase extends UseCase<MovieDetail, String> {
  @override
  Future<Either<MovieDetail, ErrorResponse>> call(String params) async {
    final res = await movieRepository.getMovieById(params);
    return res.fold(Left.new, Right.new);
  }
}

/* Trending Movie Use Case */
final trendingMovieUseCase = TrendingMovieUseCase();

class TrendingMovieUseCase
    extends UseCase<PaginatedResult<Movie>, TrendingMovieParams> {
  @override
  Future<Either<PaginatedResult<Movie>, ErrorResponse>> call(
    TrendingMovieParams params,
  ) async {
    final res = await movieRepository.getTrendingMovies(params);
    return res.fold(Left.new, Right.new);
  }
}
