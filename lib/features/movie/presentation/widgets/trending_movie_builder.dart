import 'package:movie_magic/app/app_index.dart';
import 'package:movie_magic/core/core.dart';
import 'package:movie_magic/features/movie/movie_index.dart';
import 'package:movie_magic/features/pagination/pagination_index.dart';
import 'package:movie_magic/features/shared/shared_index.dart';

class TrendingMovieBuilder extends StatelessWidget {
  const TrendingMovieBuilder({super.key, required this.i, this.loadCallback});
  final PaginatedResult<Movie> i;
  final VoidCallback? loadCallback;

  @override
  Widget build(BuildContext context) {
    if (i.results.isEmpty) {
      return InfoDisplay(title: 'Nothing here yet', lottie: Assets.movie);
    }
    return PaginatedBuilder(
      useCase: trendingMovieUseCase,
      params: (i) => TrendingMovieParams(page: i),
      totalPages: i.totalPages,
      items: i.results,
      itemBuilder: (movie) {
        return MovieCard(
          title: movie.title,
          posterUrl: movie.generatePosterUrl(),
          rating: movie.voteAverage ?? 0,
          releaseDate: movie.releaseDate.split("-").first,
        );
      },
    );
  }
}
