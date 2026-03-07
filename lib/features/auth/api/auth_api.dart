import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../constants.dart';

class AuthApi {
  /// Base URL for auth requests (from [Constants.baseUrl]).
  String get baseUrl => Constants.baseUrl;

  /// Sends a login request with the given [email], [password], and [deviceName].
  Future<http.Response> login({
    required String email,
    required String password,
    required String deviceName,
  }) async {
    final body = {
      'email': email,
      'password': password,
      'device_name': deviceName,
    };
    final base = baseUrl.endsWith('/') ? baseUrl.substring(0, baseUrl.length - 1) : baseUrl;
    return http.post(
      Uri.parse('$base/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
  }
}
