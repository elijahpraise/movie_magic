part of '../home_screen.dart';

class DiscoverTab extends StatefulWidget {
  const DiscoverTab({super.key});

  @override
  State<DiscoverTab> createState() => _DiscoverTabState();
}

class _DiscoverTabState extends State<DiscoverTab> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<DiscoverMovieBloc>().add(DiscoverMovies());
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<DiscoverMovieBloc>().add(DiscoverMovies());
      },
      child: BlocBuilder<DiscoverMovieBloc, DiscoverMovieState>(
        builder: (context, state) {
          if (state is DiscoverMovieLoading) {
            return LoadingShimmerBuilder();
          } else if (state is DiscoverMovieError) {
            return InfoDisplay(title: 'Error occurred');
          } else if (state is DiscoverMovieLoaded) {
            return DiscoverMovieBuilder(
              i: state.result,
              loadCallback: () {
                final page = state.result.page;
                context.read<DiscoverMovieBloc>().add(
                  DiscoverMovies(page: page + 1),
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
