import 'package:movie_magic/core/core.dart';
import 'package:movie_magic/features/movie/movie_index.dart';
import 'package:movie_magic/features/movie/presentation/controllers/movie_controller_index.dart';
import 'package:movie_magic/features/shared/shared_index.dart';

part 'tabs/discover_tab.dart';
part 'tabs/top_rated_tab.dart';
part 'tabs/trending_tab.dart';

enum HomeTabs { discover, trending, topRated }

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(
      initialLength: HomeTabs.values.length,
    );
    return MultiBlocListener(
      listeners: [
        /// Movie Genre Bloc Listener
        BlocListener<MovieGenreBloc, MovieGenreState>(
          listener: (context, state) {
            if (state is MovieGenreLoaded) {
              context.read<MovieGenreCubit>().setGenres(state.genres);
            }
          },
        ),
      ],
      child: ScreenFrame(
        appBar: AppBar(
          title: Text("Movie Magic", style: context.textTheme.headlineSmall),
          bottom: TabBar(
            tabs: HomeTabs.values.map((e) => Tab(text: e.label)).toList(),
            labelStyle: context.textTheme.bodyLarge,
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children:
              HomeTabs.values
                  .map(
                    (e) => switch (e) {
                      HomeTabs.discover => DiscoverTab(),
                      HomeTabs.trending => TrendingTab(),
                      HomeTabs.topRated => TopRatedTab(),
                    },
                  )
                  .toList(),
        ),
      ),
    );
  }
}
