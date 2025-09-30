import 'dart:async';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_magic/app/app_index.dart';
import 'package:movie_magic/core/core.dart';
import 'package:movie_magic/features/movie/presentation/controllers/blocs/movie_genre_bloc/movie_genre_bloc.dart';
import 'package:movie_magic/features/movie/presentation/controllers/cubits/movie_genre_cubit/movie_genre_cubit.dart';
import 'package:movie_magic/features/shared/shared_index.dart';
import 'package:movie_magic/navigation/navigation_index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MovieGenreBloc>().add(FetchMovieGenres());
      Timer(const Duration(seconds: 2), _load);
    });
  }

  @override
  Widget build(BuildContext context) {
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
      child: BaseScaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 280, child: Lottie.asset(Assets.movie)),
              Gap(8),
              Text(
                    AppConstants.appName,
                    style: context.textTheme.headlineMedium,
                  )
                  .animate()
                  .flipH(duration: 2000.ms)
                  .shimmer(duration: 2000.ms)
                  .scale(duration: 800.ms, curve: Curves.easeOutBack),
            ],
          ),
        ),
      ),
    );
  }

  void _load() {
    context.goNamed(AppRoutes.home.name);
  }
}
