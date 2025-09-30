import 'package:lottie/lottie.dart';
import 'package:movie_magic/core/core.dart';

/// Widget used for display of errors or info data loading a screen when no
/// Data is found.
class InfoDisplay extends StatelessWidget {
  const InfoDisplay({
    this.title,
    this.subtitle,
    super.key,
    this.spacing,
    this.icon,
    this.padding,
    this.iconSize,
    this.iconColor,
    this.titleStyle,
    this.subtitleStyle,
    this.subtitleAlt,
    this.lottie,
    this.lottieSize,
  });

  final Widget? icon;
  final Widget? subtitleAlt;
  final String? lottie;
  final double? iconSize;
  final double? lottieSize;
  final Color? iconColor;
  final double? spacing;
  final String? title;
  final String? subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PaddedColumn(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        padding:
            padding ??
            const EdgeInsets.only(bottom: 8) +
                const EdgeInsets.symmetric(horizontal: 20),
        children: [
          if (icon != null)
            icon!
          else if (lottie != null)
            SizedBox(height: lottieSize ?? 280, child: Lottie.asset(lottie!)),
          if (icon != null || lottie != null) Gap(spacing ?? 24),
          if (title != null)
            Text(
              title!,
              textAlign: TextAlign.center,
              style: titleStyle ?? context.textTheme.bodyLarge,
            ),
          if (subtitle != null || subtitleAlt != null) Gap(8),
          if (subtitle != null)
            Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: subtitleStyle ?? context.textTheme.bodyMedium,
            )
          else if (subtitleAlt != null)
            subtitleAlt!,
        ],
      ),
    );
  }
}
