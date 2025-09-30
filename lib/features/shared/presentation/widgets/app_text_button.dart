import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({super.key, this.onPressed, required this.text});
  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: Text(text));
  }
}
