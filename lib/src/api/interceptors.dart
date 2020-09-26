import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:chopper/chopper.dart';

class AuthInterceptor implements RequestInterceptor {
  static const String AUTH_HEADER = HttpHeaders.authorizationHeader;
  static const String BASIC = "Basic ";
  final String credentials;

  AuthInterceptor(String username, String password)
      : credentials = _getCredentials(username, password);

  bool loggedIn() => credentials != '';

  @override
  FutureOr<Request> onRequest(Request request) async =>
      applyHeader(request, AUTH_HEADER, BASIC + credentials);

  static _getCredentials(String username, String password) {
    if (username == null ||
        username.isEmpty ||
        password == null ||
        password.isEmpty) {
      return '';
    } else {
      return base64Encode(utf8.encode('$username:$password'));
    }
  }
}

class ErrorInterceptor implements ResponseInterceptor {
  @override
  FutureOr<Response> onResponse(Response response) {
    if(response.statusCode >= 400) {
      throw HttpException('${response.statusCode}');
    }
    return response;
  }

}
