import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_magic/features/shared/presentation/helpers/toast_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  UrlLauncher(this.context);
  final BuildContext context;

  LaunchMode deviceMode() {
    if (kIsWeb) {
      return LaunchMode.externalApplication;
    } else {
      return LaunchMode.inAppBrowserView;
    }
  }

  Future<void> launch({String? link, Uri? url, LaunchMode? mode}) async {
    assert(link != null || url != null, "Link and url can't be null");
    final helper = ToastHelper(context);
    final uri = url ?? Uri.parse(link!);
    try {
      await launchUrl(uri, mode: mode ?? deviceMode());
    } catch (e) {
      helper.showToast(content: 'Error - $e');
    }
  }
}
