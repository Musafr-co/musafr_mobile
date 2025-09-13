import 'package:dio/dio.dart';

import '../model/token_storage.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;

  AuthInterceptor(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = TokenStorage.accessToken;
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options); // continue
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // If status is 401, try refreshing the token
    if (err.response?.statusCode == 401) {
      final refreshed = await _refreshToken();

      if (refreshed) {
        final retryRequest = await _retry(err.requestOptions);
        return handler.resolve(retryRequest);
      }
    }

    return handler.next(err); // continue with the error
  }

  Future<bool> _refreshToken() async {
    final refreshToken = TokenStorage.refreshToken;
    if (refreshToken == null) return false;

    try {
      final response = await dio.post('/auth/refresh', data: {
        'refresh_token': refreshToken,
      });

      final newAccessToken = response.data['access_token'];
      final newRefreshToken = response.data['refresh_token'];

      TokenStorage.saveTokens(newAccessToken, newRefreshToken);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) {
    final newOptions = Options(
      method: requestOptions.method,
      headers: {
        ...requestOptions.headers,
        'Authorization': 'Bearer ${TokenStorage.accessToken}',
      },
    );

    return dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: newOptions,
    );
  }
}
