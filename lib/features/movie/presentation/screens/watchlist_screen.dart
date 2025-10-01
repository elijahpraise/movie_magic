import 'package:movie_magic/app/app_index.dart';
import 'package:movie_magic/core/core.dart';
import 'package:movie_magic/features/movie/movie_index.dart';
import 'package:movie_magic/features/movie/presentation/controllers/movie_controller_index.dart';
import 'package:movie_magic/features/shared/shared_index.dart';
import 'package:movie_magic/navigation/navigation_index.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final watchlist = context.watch<WatchlistCubit>().state;
    return ScreenFrame(
      appBar: AppBar(
        title: Text("Watchlist", style: context.textTheme.headlineSmall),
      ),
      body: CustomScrollView(
        slivers: [
          if (watchlist.isEmpty)
            SliverHelper.buildSliverFillRemaining(
              child: InfoDisplay(
                lottie: Assets.movie,
                title: 'No movies in your watchlist',
              ),
            )
          else if (watchlist.isNotEmpty)
            SliverGrid.builder(
              itemBuilder: (context, index) {
                final movie = watchlist[index];
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
              itemCount: watchlist.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.75,
              ),
            ),
        ],
      ),
    );
  }
}
