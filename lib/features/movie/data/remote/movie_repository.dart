import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_magic/core/core.dart';
import 'package:movie_magic/features/movie/movie_index.dart';

final movieRepository = MovieRepository();

abstract class MovieRepositoryInterface {
  Future<Either<PaginatedResult<Movie>, ErrorResponse>> discoverMovies(
    DiscoverMovieParams params,
  );

  Future<Either<MovieDetail, ErrorResponse>> getMovieById(String id);

  Future<Either<List<Genre>, ErrorResponse>> getMovieGenres();

  Future<Either<List<MovieTrailer>, ErrorResponse>> getMovieTrailer(String id);

  Future<Either<PaginatedResult<Movie>, ErrorResponse>> getTopRatedMovies(
    TopRatedMovieParams params,
  );

  Future<Either<PaginatedResult<Movie>, ErrorResponse>> getTrendingMovies(
    TrendingMovieParams params,
  );

  Future<Either<PaginatedResult<Movie>, ErrorResponse>> searchForMovie(
    SearchMovieParams params,
  );
}

class MovieRepository implements MovieRepositoryInterface {
  @override
  Future<Either<PaginatedResult<Movie>, ErrorResponse>> discoverMovies(
    DiscoverMovieParams params,
  ) async {
    try {
      final response = await movieService.discoverMovies(
        queryParams: params.toJson(),
      );
      final json = response.data as Json;
      final moviesResponse = json['results'] as List<dynamic>;
      final movies =
          moviesResponse.map((e) => Movie.fromJson(e as Json)).toList();
      final dataResponse = PaginatedResult(
        page: json['page'],
        results: movies,
        count: moviesResponse.length,
        totalPages: json['total_pages'],
      );
      return Left(dataResponse);
    } on DioException catch (e) {
      final errorResponse = ApiError.handleError(e);
      return Right(errorResponse);
    } catch (e) {
      final error = ErrorResponse(message: e.toString());
      return Right(error);
    }
  }

  @override
  Future<Either<MovieDetail, ErrorResponse>> getMovieById(String id) async {
    try {
      final response = await movieService.getMovieById(id);
      final json = response.data as Json;
      final dataResponse = MovieDetail.fromJson(json);
      return Left(dataResponse);
    } on DioException catch (e) {
      final errorResponse = ApiError.handleError(e);
      return Right(errorResponse);
    } catch (e) {
      final error = ErrorResponse(message: e.toString());
      return Right(error);
    }
  }

  @override
  Future<Either<List<Genre>, ErrorResponse>> getMovieGenres() async {
    try {
      final response = await movieService.getMovieGenres();
      final json = response.data as Json;
      final genres = json['genres'] as List<dynamic>;
      final dataResponse =
          genres.map((e) => Genre.fromJson(e as Json)).toList();
      return Left(dataResponse);
    } on DioException catch (e) {
      final errorResponse = ApiError.handleError(e);
      return Right(errorResponse);
    } catch (e) {
      final error = ErrorResponse(message: e.toString());
      return Right(error);
    }
  }

  @override
  Future<Either<List<MovieTrailer>, ErrorResponse>> getMovieTrailer(
    String id,
  ) async {
    try {
      final response = await movieService.getMovieTrailer(id);
      final json = response.data as Json;
      final genres = json['results'] as List<dynamic>;
      final dataResponse =
          genres.map((e) => MovieTrailer.fromJson(e as Json)).toList();
      return Left(dataResponse);
    } on DioException catch (e) {
      final errorResponse = ApiError.handleError(e);
      return Right(errorResponse);
    } catch (e) {
      final error = ErrorResponse(message: e.toString());
      return Right(error);
    }
  }

  @override
  Future<Either<PaginatedResult<Movie>, ErrorResponse>> getTopRatedMovies(
    TopRatedMovieParams params,
  ) async {
    try {
      final response = await movieService.getTopRatedMovies(
        queryParams: params.toJson(),
      );
      final json = response.data as Json;
      final moviesResponse = json['results'] as List<dynamic>;
      final movies =
          moviesResponse.map((e) => Movie.fromJson(e as Json)).toList();
      final dataResponse = PaginatedResult(
        page: json['page'],
        results: movies,
        count: moviesResponse.length,
        totalPages: json['total_pages'],
      );
      return Left(dataResponse);
    } on DioException catch (e) {
      final errorResponse = ApiError.handleError(e);
      return Right(errorResponse);
    } catch (e) {
      final error = ErrorResponse(message: e.toString());
      return Right(error);
    }
  }

  @override
  Future<Either<PaginatedResult<Movie>, ErrorResponse>> getTrendingMovies(
    TrendingMovieParams params,
  ) async {
    try {
      final response = await movieService.getTrendingMovies(
        queryParams: params.toJson(),
      );
      final json = response.data as Json;
      final moviesResponse = json['results'] as List<dynamic>;
      final movies =
          moviesResponse.map((e) => Movie.fromJson(e as Json)).toList();
      final dataResponse = PaginatedResult(
        page: json['page'],
        results: movies,
        count: moviesResponse.length,
        totalPages: json['total_pages'],
      );
      return Left(dataResponse);
    } on DioException catch (e) {
      final errorResponse = ApiError.handleError(e);
      return Right(errorResponse);
    } catch (e) {
      final error = ErrorResponse(message: e.toString());
      return Right(error);
    }
  }

  @override
  Future<Either<PaginatedResult<Movie>, ErrorResponse>> searchForMovie(
    SearchMovieParams params,
  ) async {
    try {
      final response = await movieService.searchForMovie(
        queryParams: params.toJson(),
      );
      final json = response.data as Json;
      final moviesResponse = json['results'] as List<dynamic>;
      final movies =
          moviesResponse.map((e) => Movie.fromJson(e as Json)).toList();
      final dataResponse = PaginatedResult(
        page: json['page'],
        results: movies,
        count: moviesResponse.length,
        totalPages: json['total_pages'],
      );
      return Left(dataResponse);
    } on DioException catch (e) {
      final errorResponse = ApiError.handleError(e);
      return Right(errorResponse);
    } catch (e) {
      final error = ErrorResponse(message: e.toString());
      return Right(error);
    }
  }
}
