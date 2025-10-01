import 'package:movie_magic/core/core.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, this.onPressed, required this.text});
  final VoidCallback? onPressed;
  final String text;

  factory AppButton.icon({
    required Widget icon,
    required String text,
    VoidCallback? onPressed,
  }) {
    return _AppButtonWithIcon(text: text, icon: icon, onPressed: onPressed);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}

class _AppButtonWithIcon extends AppButton {
  const _AppButtonWithIcon({
    required super.text,
    required this.icon,
    super.onPressed,
  });
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      iconAlignment: IconAlignment.end,
      onPressed: onPressed,
      label: Text(text),
      icon: icon,
    );
  }
}
