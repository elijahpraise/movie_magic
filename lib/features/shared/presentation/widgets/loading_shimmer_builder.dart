import 'package:flutter/material.dart';
import 'package:movie_magic/features/shared/presentation/widgets/loading_shimmer.dart';

class LoadingShimmerBuilder extends StatelessWidget {
  const LoadingShimmerBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAnimatedGrid(
          itemBuilder: (context, index, animation) {
            return LoadingShimmer();
          },
          initialItemCount: 50,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.75,
          ),
        ),
      ],
    );
  }
}
