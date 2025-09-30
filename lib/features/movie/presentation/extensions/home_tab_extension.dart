import 'package:movie_magic/core/core.dart';
import 'package:movie_magic/features/movie/presentation/screens/home_screen/home_screen.dart';

extension HomeTabExtension on HomeTabs {
  String get label => switch (this) {
    HomeTabs.discover => name.capitalize(),
    HomeTabs.trending => name.capitalize(),
    HomeTabs.topRated => 'top rated'.capitalize(),
  };
}
