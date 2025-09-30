import 'dart:async';

import 'package:dio/dio.dart';
import 'package:movie_magic/core/core.dart';

part 'interceptor_strings.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor();

  final _interStr = InterceptorString();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final headers = options.headers;

    if (headers.containsKey(_interStr.reqToken)) {
      final token = Env.apiToken;
      headers.remove(_interStr.reqToken);
      headers[_interStr.auth] = _interStr.authValue(token);
    }

    // Set default headers
    headers[_interStr.accept] = _interStr.acceptValue;
    headers[_interStr.contentType] = _interStr.acceptJson;

    super.onRequest(options, handler);
  }
}

/// Extension to convert string to RequestMethod
extension RequestMethodStringExt on String? {
  /// Convert HTTP method string to RequestMethod enum
  RequestMethod toRequestMethod() {
    return switch (this) {
      'GET' => RequestMethod.get,
      'POST' => RequestMethod.post,
      'DELETE' => RequestMethod.delete,
      'PUT' => RequestMethod.put,
      'PATCH' => RequestMethod.patch,
      'HEAD' => RequestMethod.get,
      'OPTIONS' => RequestMethod.get,
      String() => RequestMethod.get,
      null => RequestMethod.get,
    };
  }
}
