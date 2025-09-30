import 'package:flutter/material.dart';
import 'package:movie_magic/features/shared/presentation/widgets/screen_frame.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenFrame(
      appBar: AppBar(title: const Text("Watchlist")),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: 6,
        itemBuilder:
            (_, index) => Container(
              color: Colors.deepPurple.shade200,
              child: Center(child: Text("Saved $index")),
            ),
      ),
    );
  }
}
