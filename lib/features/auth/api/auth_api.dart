import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../constants.dart';

class AuthApi {
  /// Base URL for auth requests (from [Constants.baseUrl]).
  String get baseUrl => Constants.baseUrl;

  /// Base URL with trailing slash stripped, for building paths (e.g. [_base]/login).
  String get _base => baseUrl.endsWith('/')
      ? baseUrl.substring(0, baseUrl.length - 1)
      : baseUrl;

  /// Device name sent with login (API owns this; UI does not set it).
  static const String _deviceName = 'founta_app';

  /// Sends a login request with the given [email] and [password].
  Future<http.Response> login({
    required String email,
    required String password,
  }) async {
    // Easy to find: grep "AuthApi" or search for "[AuthApi]" in the run console
    print(
      '\n[AuthApi] POST $_base/login\n body: $email, $password, $_deviceName',
    );
    final body = {
      'email': email,
      'password': password,
      'device_name': _deviceName,
    };
    final response = await http.post(
      Uri.parse('$_base/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    print(
      '[AuthApi] Response ${response.statusCode}  body: ${response.body}\n',
    );
    return response;
  }
}
