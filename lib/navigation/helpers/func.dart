import 'dart:async';

import 'package:flutter/services.dart';
import 'package:movie_magic/app/app_index.dart';
import 'package:movie_magic/core/core.dart';
import 'package:movie_magic/features/shared/shared_index.dart';

FutureOr<bool> goHome(BuildContext context) {
  context.goNamed('<Home>');
  return false;
}

FutureOr<bool?> showExitDialog(BuildContext context) {
  return DialogHelper<bool>(context).showDialogV1(
    alignment: Alignment.center,
    borderRadius: BorderRadius.circular(12),
    insetPadding: const EdgeInsets.symmetric(horizontal: 24),
    content: ActionDialog(
      title: 'Exit ${AppConstants.appName}?',
      subtitle:
          '''Are you sure you want to exit ${AppConstants.appName}?, Any unsaved changes would be lost.''',
      primaryButtonText: ContentStrings.exit,
      primaryButtonAction: () {
        context.popDialog();
        SystemNavigator.pop();
      },
      secondaryButtonAction: context.popDialog,
    ),
  );
}
