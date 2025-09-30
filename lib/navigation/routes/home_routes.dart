import 'package:go_router/go_router.dart';
import 'package:movie_magic/navigation/navigation_index.dart';

final homeRoutes = <RouteBase>[
  GoRoute(
    path: AppRoutes.home.path,
    name: AppRoutes.home.name,
    builder: (context, state) => const HomeScreen(),
  ),
];
