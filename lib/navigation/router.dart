import 'package:movie_magic/core/core.dart';
import 'package:movie_magic/navigation/navigation_index.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: AppRoutes.splash.path,
  navigatorKey: rootNavigatorKey,
  routes: [
    GoRoute(
      path: AppRoutes.splash.path,
      builder: (context, state) => const SplashScreen(),
    ),

    /// Main app
    StatefulShellRoute.indexedStack(
      builder: (context, state, child) => MainAppScreen(child: child),
      branches: [
        /// Home
        StatefulShellBranch(routes: homeRoutes),

        /// Search
        StatefulShellBranch(routes: searchRoutes),

        /// Watchlist
        StatefulShellBranch(routes: watchlistRoutes),
      ],
    ),
  ],
);
