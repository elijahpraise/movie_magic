import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_magic/features/movie/presentation/controllers/movie_controller_index.dart';

final movieBlocProvider = <BlocProvider>[
  BlocProvider<DiscoverMovieBloc>(create: (context) => discoverMovieBloc),
  BlocProvider<TrendingMovieBloc>(create: (context) => trendingMovieBloc),
  BlocProvider<MovieGenreBloc>(create: (context) => movieGenreBloc),
  BlocProvider<MovieDetailBloc>(create: (context) => movieDetailBloc),
  BlocProvider<MovieGenreCubit>(create: (context) => movieGenreCubit),
];
