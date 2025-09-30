import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();

  static const String appName = 'Movie Magic';

  static const Size designSize = Size(390, 844);

  static const List<String> imageExtensions = [
    'png',
    'jpg',
    'jpeg',
    'bmp',
    'gif',
    'heif',
  ];

  static const List<String> videoExtensions = [
    'mp4',
    'mkv',
    'avi',
    'mov',
    'wmv',
    'flv',
    'webm',
  ];

  static const List<String> mediaExtensions = [
    ...videoExtensions,
    ...imageExtensions,
  ];
}
