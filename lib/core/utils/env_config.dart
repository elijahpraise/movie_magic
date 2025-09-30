import 'dart:developer';

class EnvConfig {
  EnvConfig._();

  static const String _apiBaseUrl = String.fromEnvironment(
    'tmbd_base_url',
    defaultValue: 'https://api.test_app.com',
  );

  static const String _apiToken = String.fromEnvironment(
    'tmbd_access_token',
    defaultValue: 'https://api.test_app.com',
  );

  static const int _apiTimeout = int.fromEnvironment(
    'API_TIMEOUT',
    defaultValue: 30000,
  );

  static const bool _enableLogging = bool.fromEnvironment(
    'ENABLE_LOGGING',
    defaultValue: true,
  );

  /// API base URL
  static String get apiBaseUrl => _apiBaseUrl;
  static String get apiToken => _apiToken;

  /// API timeout in milliseconds
  static int get apiTimeout => _apiTimeout;

  /// Enable logging flag
  static bool get enableLogging => _enableLogging;

  /// Get all environment variables as a map (useful for debugging)
  static Map<String, dynamic> get allVariables => {
    'API_BASE_URL': apiBaseUrl,
    'API_TIMEOUT': apiTimeout,
    'ENABLE_LOGGING': enableLogging,
  };

  /// Print all environment variables (useful for debugging)
  static void printVariables() {
    log('Environment Variables:');
    allVariables.forEach((key, value) {
      log('$key: $value');
    });
  }
}

/// Global shorthand for easy access
class Env {
  static String get apiBaseUrl => EnvConfig.apiBaseUrl;
  static String get apiToken => EnvConfig.apiToken;
  static int get apiTimeout => EnvConfig.apiTimeout;
  static bool get enableLogging => EnvConfig.enableLogging;
}
