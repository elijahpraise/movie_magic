import 'package:movie_magic/app/app_index.dart';
import 'package:movie_magic/core/core.dart';
import 'package:movie_magic/features/movie/movie_index.dart';
import 'package:movie_magic/features/movie/presentation/controllers/movie_controller_index.dart';
import 'package:movie_magic/features/shared/shared_index.dart';

class SearchScreen extends HookWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    return ScreenFrame(
      appBar: AppBar(
        title: Text("Search", style: context.textTheme.headlineSmall),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 68),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  final event = SearchForMovie(query: value);
                  context.read<MovieSearchBloc>().add(event);
                }
              },
              decoration: InputDecoration(
                hintText: "Search movies or series...",
                prefixIcon: InkWell(
                  onTap: () {
                    if (controller.text.isNotEmpty) {
                      final event = SearchForMovie(query: controller.text);
                      context.read<MovieSearchBloc>().add(event);
                    }
                  },
                  child: Icon(Icons.search),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final event = SearchForMovie(query: controller.text);
          context.read<MovieSearchBloc>().add(event);
        },
        child: BlocBuilder<MovieSearchBloc, MovieSearchState>(
          builder: (context, state) {
            if (state is MovieSearchInitial) {
              return InfoDisplay(
                title: 'No recent searches',
                lottie: Assets.movie,
              );
            } else if (state is MovieSearchLoading) {
              return LoadingShimmerBuilder();
            } else if (state is MovieSearchError) {
              return InfoDisplay(
                title: 'Oops',
                subtitle: state.error.message,
                lottie: Assets.movie,
              );
            } else if (state is MovieSearchLoaded) {
              return MovieSearchBuilder(
                i: state.result,
                query: controller.text,
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
