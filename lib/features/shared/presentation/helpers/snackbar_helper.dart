import 'package:movie_magic/core/core.dart';

class SnackBarHelper {
  SnackBarHelper(this.context);
  final BuildContext context;

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar({
    required String content,
    double? radius,
    BorderRadiusGeometry? borderRadius,
    TextStyle? contentStyle,
    Duration? duration,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          content,
          textAlign: TextAlign.center,
          style: contentStyle,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 8),
        ),
        duration: duration ?? const Duration(milliseconds: 1000),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
