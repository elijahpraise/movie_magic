import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_magic/features/movie/presentation/controllers/movie_controller_index.dart';

final movieBlocProvider = <BlocProvider>[
  BlocProvider<DiscoverMovieBloc>(create: (context) => discoverMovieBloc),
  BlocProvider<TrendingMovieBloc>(create: (context) => trendingMovieBloc),
  BlocProvider<TopRatedMovieBloc>(create: (context) => topRatedMovieBloc),
  BlocProvider<MovieGenreBloc>(create: (context) => movieGenreBloc),
  BlocProvider<MovieDetailBloc>(create: (context) => movieDetailBloc),
  BlocProvider<MovieSearchBloc>(create: (context) => movieSearchBloc),
  BlocProvider<MovieTrailerBloc>(create: (context) => movieTrailerBloc),
  BlocProvider<MovieCubit>(create: (context) => movieCubit),
  BlocProvider<MovieGenreCubit>(create: (context) => movieGenreCubit),
  BlocProvider<WatchlistCubit>(create: (context) => watchlistCubit),
];
