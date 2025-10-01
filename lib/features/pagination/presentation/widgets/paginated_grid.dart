import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie_magic/features/shared/presentation/widgets/loading_shimmer.dart';

class PaginatedGrid<T> extends HookWidget {
  const PaginatedGrid({
    super.key,
    required this.isLoading,
    required this.items,
    required this.itemBuilder,
    required this.loadCallback,
  });
  final bool isLoading;
  final List<T> items;
  final Widget Function(T) itemBuilder;
  final VoidCallback loadCallback;

  @override
  Widget build(BuildContext context) {
    final controller = useScrollController();
    controller.addListener(() {
      final position = controller.position;
      final isAtBottom = position.pixels >= position.maxScrollExtent;
      final atEdge = controller.position.atEdge;
      if (isAtBottom && !isLoading && atEdge) {
        loadCallback();
      }
    });
    return CustomScrollView(
      controller: controller,
      slivers: [
        SliverGrid.builder(
          itemBuilder: (context, index) {
            if (index > items.length - 1) {
              return LoadingShimmer();
            }
            return itemBuilder(items[index]);
          },
          itemCount: items.length + 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.75,
          ),
        ),
      ],
    );
  }
}
