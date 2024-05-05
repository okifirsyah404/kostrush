import 'package:dio/dio.dart';

typedef TokenCallback = Future<String> Function();

class AuthHeaderInterceptor extends Interceptor {
  AuthHeaderInterceptor({required this.onToken});

  TokenCallback onToken;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String token = await onToken();
    bool authorization = true;
    if (options.headers.values.isNotEmpty) {
      options.headers.forEach((key, value) {
        if (key == "authorization" && value == "") {
          authorization = false;
        }
      });
    }

    if (authorization) {
      if (options.headers.entries
          .where((element) => element.key == "authorization")
          .isEmpty) {
        options.headers.addAll({
          'content-type': 'application/json',
          'authorization': "Bearer $token"
        });
      }
    } else {
      options.headers
          .removeWhere((key, value) => key == "authorization" && value == "");
    }
    super.onRequest(options, handler);
  }
}
