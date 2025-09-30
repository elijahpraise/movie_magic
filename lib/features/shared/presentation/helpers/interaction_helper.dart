import 'package:flutter/services.dart';
import 'package:movie_magic/core/core.dart';
import 'package:movie_magic/features/shared/shared_index.dart';

class InteractionHelper {
  InteractionHelper(this.context);
  final BuildContext context;

  void copy(String text, {String? message}) {
    try {
      Clipboard.setData(ClipboardData(text: text));
      ToastHelper(context).showToast(content: message ?? 'Copied to clipboard');
    } catch (e) {
      ToastHelper(
        context,
      ).showToast(content: e.toString(), toastType: ToastType.error);
    }
  }

  void showTooltip(String text) {
    // TODO(elijahpraise): implement this
    throw UnimplementedError('Show tooltip not implemented');
  }

  static void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
