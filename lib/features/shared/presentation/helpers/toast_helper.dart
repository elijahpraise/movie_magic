import 'package:movie_magic/core/core.dart';
import 'package:movie_magic/features/shared/presentation/widgets/toast_v1.dart';
import 'package:oktoast/oktoast.dart';

class ToastHelper {
  ToastHelper(this.context);

  final BuildContext context;

  ToastFuture showComingSoon() => showToast(content: 'Coming soon...');

  ToastFuture showToast({
    ToastType toastType = ToastType.info,
    String? content,
    bool? showDismiss,
    Duration? duration,
    TextStyle? contentStyle,
    Color? backgroundColor,
    double? radius,
    BoxConstraints? constraints,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    ToastPosition? position,
    IconData? iconData,
  }) {
    return showToastWidget(
      ToastV1(
        toastType: toastType,
        contentStyle: contentStyle,
        content: content,
      ),
      context: context,
      duration: duration ?? const Duration(seconds: 2),
      dismissOtherToast: true,
      position:
          position ??
          const ToastPosition(align: Alignment.topCenter, offset: 32),
    );
  }
}
