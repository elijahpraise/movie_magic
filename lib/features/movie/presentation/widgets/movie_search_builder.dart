import 'package:movie_magic/app/app_index.dart';
import 'package:movie_magic/core/core.dart';
import 'package:movie_magic/features/movie/movie_index.dart';
import 'package:movie_magic/features/movie/presentation/controllers/movie_controller_index.dart';
import 'package:movie_magic/features/pagination/pagination_index.dart';
import 'package:movie_magic/features/shared/shared_index.dart';
import 'package:movie_magic/navigation/navigation_index.dart';

class MovieSearchBuilder extends StatelessWidget {
  const MovieSearchBuilder({required this.i, required this.query, super.key});
  final String query;
  final PaginatedResult<Movie> i;

  @override
  Widget build(BuildContext context) {
    if (i.results.isEmpty) {
      return SliverHelper.buildCustomScrollWidget(
        child: InfoDisplay(title: 'Nothing here yet', lottie: Assets.movie),
      );
    }
    return PaginatedBuilder(
      useCase: movieSearchUseCase,
      params: (i) => SearchMovieParams(query: query, page: i),
      totalPages: i.totalPages,
      items: i.results,
      itemBuilder: (movie) {
        return MovieCard(
          title: movie.title,
          onTap: () {
            context.read<MovieCubit>().setMovie(movie);
            context.pushNamed(AppRoutes.detail.name);
          },
          posterUrl: movie.generatePosterUrl(),
          rating: movie.voteAverage ?? 0,
          releaseDate: movie.releaseDate.split("-").first,
        );
      },
    );
  }
}
