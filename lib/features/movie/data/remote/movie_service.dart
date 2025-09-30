import 'package:dio/dio.dart';
import 'package:movie_magic/core/core.dart';

final movieService = MovieService();

abstract class MovieServiceInterface {
  Future<Response<dynamic>> discoverMovies();

  Future<Response<dynamic>> discoverTvShows();

  Future<Response<dynamic>> getMovieById(String id);

  Future<Response<dynamic>> getMovieGenres();

  Future<Response<dynamic>> getTrendingMovies();
}

class MovieService implements MovieServiceInterface {
  @override
  Future<Response> discoverMovies({Json? queryParams}) async {
    final response = await apiClient.get(
      'discover/movie',
      queryParams: queryParams,
      reqToken: true,
    );
    return response;
  }

  @override
  Future<Response> discoverTvShows({Json? queryParams}) async {
    final response = await apiClient.get(
      'discover/tv',
      queryParams: queryParams,
      reqToken: true,
    );
    return response;
  }

  @override
  Future<Response> getMovieById(String id) async {
    final response = await apiClient.get('movie/$id', reqToken: true);
    return response;
  }

  @override
  Future<Response> getMovieGenres({Json? queryParams}) async {
    final response = await apiClient.get(
      'genre/movie/list',
      queryParams: queryParams,
      reqToken: true,
    );
    return response;
  }

  @override
  Future<Response> getTrendingMovies({Json? queryParams}) async {
    final response = await apiClient.get(
      'trending/movie/week',
      queryParams: queryParams,
      reqToken: true,
    );
    return response;
  }
}
