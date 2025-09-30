import 'package:movie_magic/core/core.dart';

enum ToastType { info, error, success }

class ToastV1 extends StatelessWidget {
  const ToastV1({
    super.key,
    this.toastType = ToastType.info,
    this.content,
    this.contentStyle,
    this.iconData,
  });
  final IconData? iconData;
  final String? content;
  final TextStyle? contentStyle;
  final ToastType toastType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: switch (toastType) {
            ToastType.info => context.theme.snackBarTheme.backgroundColor,
            ToastType.error => context.theme.colorScheme.error,
            ToastType.success => context.theme.colorScheme.primary,
          },
        ),
        child: PaddedRow(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          children: [
            Icon(
              iconData ??
                  switch (toastType) {
                    ToastType.info => Icons.info_outline,
                    ToastType.error => Icons.warning_amber_rounded,
                    ToastType.success => Icons.check,
                  },
              color: Colors.white,
            ),
            Gap(8),
            Expanded(
              child: Text(
                content ?? '',
                style:
                    contentStyle ??
                    context.textTheme.bodySmall?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
