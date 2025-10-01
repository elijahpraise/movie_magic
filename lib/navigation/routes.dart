import 'package:movie_magic/navigation/navigation_index.dart';

class AppRoutes {
  /// Splash
  static const splash = Route(path: '/');

  static const home = Route(path: '/home', name: 'home');

  static const search = Route(path: '/search', name: 'search');

  static const watchlist = Route(path: '/watchlist', name: 'watchlist');

  static const detail = Route(path: 'detail', name: 'detail');
}
