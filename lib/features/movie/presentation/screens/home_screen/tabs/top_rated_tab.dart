part of '../home_screen.dart';

class TopRatedTab extends StatefulWidget {
  const TopRatedTab({super.key});

  @override
  State<TopRatedTab> createState() => _TopRatedTabState();
}

class _TopRatedTabState extends State<TopRatedTab> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TopRatedMovieBloc>().add(FetchTopRatedMovies());
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<TopRatedMovieBloc>().add(FetchTopRatedMovies());
      },
      child: BlocBuilder<TopRatedMovieBloc, TopRatedMovieState>(
        builder: (context, state) {
          if (state is TopRatedMovieLoading) {
            return LoadingShimmerBuilder();
          } else if (state is TopRatedMovieError) {
            return InfoDisplay(title: 'Error occurred');
          } else if (state is TopRatedMovieLoaded) {
            return TrendingMovieBuilder(
              i: state.result,
              loadCallback: () {
                final page = state.result.page;
                context.read<TopRatedMovieBloc>().add(
                  FetchTopRatedMovies(page: page + 1),
                );
              },
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
