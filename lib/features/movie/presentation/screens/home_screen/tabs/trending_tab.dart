part of '../home_screen.dart';

class TrendingTab extends StatefulWidget {
  const TrendingTab({super.key});

  @override
  State<TrendingTab> createState() => _TrendingTabState();
}

class _TrendingTabState extends State<TrendingTab> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TrendingMovieBloc>().add(FetchTrendingMovies());
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<TrendingMovieBloc>().add(FetchTrendingMovies());
      },
      child: BlocBuilder<TrendingMovieBloc, TrendingMovieState>(
        builder: (context, state) {
          if (state is TrendingMovieLoading) {
            return LoadingShimmerBuilder();
          } else if (state is TrendingMovieError) {
            return InfoDisplay(title: 'Error occurred');
          } else if (state is TrendingMovieLoaded) {
            return TrendingMovieBuilder(
              i: state.result,
              loadCallback: () {
                final page = state.result.page;
                context.read<TrendingMovieBloc>().add(
                  FetchTrendingMovies(page: page + 1),
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
