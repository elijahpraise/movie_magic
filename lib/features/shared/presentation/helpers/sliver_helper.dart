import 'package:movie_magic/core/core.dart';

class SliverHelper {
  SliverHelper(this.context);
  final BuildContext context;

  static Widget buildSliverFillRemaining({
    bool hasScrollBody = false,
    Widget? child,
  }) {
    return SliverFillRemaining(hasScrollBody: hasScrollBody, child: child);
  }

  static Widget buildScrollable(Widget child) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(right: 16),
      child: child,
    );
  }

  static Widget buildCustomScrollWidget({required Widget child}) {
    return CustomScrollView(
      slivers: [SliverFillRemaining(hasScrollBody: false, child: child)],
    );
  }

  static Widget buildSliverSeparatedList({
    required int itemCount,
    required Widget? Function(BuildContext, int) itemBuilder,
    required Widget? Function(BuildContext, int) separatorBuilder,
    EdgeInsets? padding,
  }) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: padding ?? EdgeInsets.zero,
          sliver: SliverList.separated(
            separatorBuilder: separatorBuilder,
            itemBuilder: itemBuilder,
            itemCount: itemCount,
          ),
        ),
      ],
    );
  }
}
