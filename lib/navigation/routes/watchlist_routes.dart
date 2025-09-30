import 'package:go_router/go_router.dart';
import 'package:movie_magic/navigation/navigation_index.dart';

final watchlistRoutes = <RouteBase>[
  GoRoute(
    path: AppRoutes.watchlist.path,
    name: AppRoutes.watchlist.name,
    builder: (context, state) => const WatchlistScreen(),
  ),
];
