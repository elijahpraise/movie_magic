import 'package:movie_magic/app/app_index.dart';
import 'package:movie_magic/core/core.dart';
import 'package:movie_magic/features/shared/shared_index.dart';

class ActionDialog extends StatelessWidget {
  const ActionDialog({
    super.key,
    this.width,
    this.title,
    this.subtitle,
    this.titleAlt,
    this.subtitleAlt,
    this.primaryButtonText,
    this.secondaryButtonText,
    this.primaryButton,
    this.secondaryButton,
    this.primaryButtonAction,
    this.secondaryButtonAction,
    this.primaryTextStyle,
    this.secondaryTextStyle,
  });
  final double? width;
  final String? title;
  final String? subtitle;
  final Widget? titleAlt;
  final Widget? subtitleAlt;
  final String? primaryButtonText;
  final String? secondaryButtonText;
  final Widget? primaryButton;
  final Widget? secondaryButton;
  final TextStyle? primaryTextStyle;
  final TextStyle? secondaryTextStyle;
  final VoidCallback? primaryButtonAction;
  final VoidCallback? secondaryButtonAction;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final dialogTheme = context.theme.dialogTheme;
    final titleStyle = dialogTheme.titleTextStyle;
    final subtitleStyle = dialogTheme.contentTextStyle;
    return SizedBox(
      width: width ?? size.width,
      child: SeparatedColumn(
        mainAxisSize: MainAxisSize.min,
        separatorBuilder: () => const Gap(11),
        padding:
            const EdgeInsets.symmetric(horizontal: 24) +
            const EdgeInsets.only(top: 24, bottom: 12),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (titleAlt != null)
            titleAlt!
          else if (title != null)
            Text(title!, style: titleStyle),
          if (subtitleAlt != null)
            subtitleAlt!
          else if (subtitle != null)
            Text(subtitle!, style: subtitleStyle),
          const DividerV1(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (secondaryButton != null)
                secondaryButton!
              else ...[
                AppTextButton(
                  text: secondaryButtonText ?? ContentStrings.cancel,
                  onPressed: secondaryButtonAction,
                ),
                const Gap(15),
              ],
              if (primaryButton != null)
                primaryButton!
              else
                AppTextButton(
                  text: primaryButtonText ?? ContentStrings.confirm,
                  onPressed: primaryButtonAction,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
