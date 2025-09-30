import 'package:movie_magic/core/core.dart';
import 'package:movie_magic/features/shared/presentation/widgets/screen_frame.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      appBar: AppBar(
        title: Text("Search", style: context.textTheme.headlineSmall),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search movies or series...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder:
                  (_, index) => ListTile(
                    leading: Container(width: 50, color: Colors.grey),
                    title: Text("Movie Title $index"),
                    subtitle: Text("2025 • Action"),
                    trailing: Icon(Icons.chevron_right),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
