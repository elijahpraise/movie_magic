import 'package:go_router/go_router.dart';
import 'package:movie_magic/navigation/navigation_index.dart';

final searchRoutes = <RouteBase>[
  GoRoute(
    path: AppRoutes.search.path,
    name: AppRoutes.search.name,
    builder: (context, state) => const SearchScreen(),
  ),
];
