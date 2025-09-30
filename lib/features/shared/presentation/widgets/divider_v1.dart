import 'package:movie_magic/core/core.dart';

class DividerV1 extends StatelessWidget {
  const DividerV1({
    super.key,
    this.height,
    this.width,
    this.color,
    this.borderRadius,
  });
  final double? height;
  final double? width;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: height ?? 1,
      width: width ?? size.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color ?? context.theme.dividerColor,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
