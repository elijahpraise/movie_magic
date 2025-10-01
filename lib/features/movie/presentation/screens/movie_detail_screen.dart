import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:movie_magic/core/core.dart';
import 'package:movie_magic/features/movie/movie_index.dart';
import 'package:movie_magic/features/movie/presentation/controllers/movie_controller_index.dart';
import 'package:movie_magic/features/shared/presentation/helpers/toast_helper.dart';
import 'package:movie_magic/features/shared/presentation/helpers/url_launcher.dart';
import 'package:movie_magic/features/shared/presentation/widgets/app_button.dart';
import 'package:movie_magic/features/shared/presentation/widgets/screen_frame.dart';

class MovieDetailScreen extends StatefulHookWidget {
  const MovieDetailScreen({super.key});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final id = context.read<MovieCubit>().state?.id ?? 0;
      context.read<MovieDetailBloc>().add(FetchMovieDetails(id.toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final movie = context.read<MovieCubit>().state;
    // final movieDetail = useState<MovieDetail?>(null);
    final movieTrailerState = context.watch<MovieTrailerBloc>().state;
    return MultiBlocListener(
      listeners: [
        /// Movie Trailer Bloc Listener
        BlocListener<MovieTrailerBloc, MovieTrailerState>(
          listener: (context, state) {
            if (state is MovieTrailerLoaded) {
              if (state.trailers.isEmpty) {
                ToastHelper(
                  context,
                ).showToast(content: 'No trailer was found for this movie');
                return;
              }
              final official = state.trailers.where((e) => e.official).first;
              final url = Uri.parse(official.generateYoutubeLink());
              UrlLauncher(context).launch(url: url);
            }
          },
        ),
      ],
      child: ScreenFrame(
        isLoading: movieTrailerState is MovieTrailerLoading,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 400,
              pinned: true,
              iconTheme: context.theme.iconTheme.copyWith(color: Colors.white),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: 'movie${movie?.title}${movie?.releaseDate}',
                  child: DecoratedBox(
                    position: DecorationPosition.foreground,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.1),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: movie?.generatePosterUrl() ?? '',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie?.title ?? '',
                      style: context.textTheme.headlineSmall,
                    ),
                    Gap(16),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber),
                        const SizedBox(width: 6),
                        Text(
                          "${movie?.voteAverage?.toStringAsFixed(1)}/10  •  ${movie?.releaseDate}",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const Gap(16),
                    // ✅ Genres
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children:
                          (movie?.genreIds ?? []).map((g) {
                            final genres =
                                context.read<MovieGenreCubit>().state;
                            final result = genres.where((e) => e.id == g).first;
                            return Chip(
                              label: Text(
                                result.name,
                                style: context.textTheme.bodyMedium,
                              ),
                            );
                          }).toList(),
                    ),
                    Gap(16),

                    const Text(
                      "Movie Overview",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(8),
                    Text(
                      movie?.overview ?? '',
                      style: TextStyle(fontSize: 15, height: 1.5),
                    ),

                    const Gap(20),
                    AppButton.icon(
                      onPressed: () {
                        final id = movie?.id ?? 0;
                        context.read<MovieTrailerBloc>().add(
                          FetchMovieTrailer(id.toString()),
                        );
                      },
                      icon: const Icon(Icons.play_arrow_rounded),
                      text: 'Watch Trailer',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension MovieTrailerExtension on MovieTrailer {
  String generateYoutubeLink() {
    return 'https://www.youtube.com/watch?v=$key';
  }
}
