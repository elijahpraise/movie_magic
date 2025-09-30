import 'package:movie_magic/core/core.dart';

class NavBar extends StatelessWidget {
  const NavBar({required this.currentIndex, super.key, this.onTap});
  final int currentIndex;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items:
          Tabs.values.map((e) {
            return BottomNavigationBarItem(
              icon: Icon(e.iconName),
              label: e.name.capitalize(),
            );
          }).toList(),
    );
  }
}

enum Tabs { home, search, watchlist }

extension TabsExt on Tabs {
  IconData get iconName {
    return switch (this) {
      Tabs.home => Icons.home_rounded,
      Tabs.search => Icons.search_rounded,
      Tabs.watchlist => Icons.bookmark,
    };
  }
}
