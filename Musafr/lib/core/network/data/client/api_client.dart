import 'package:dio/dio.dart';
import 'package:musafr/core/network/data/interceptor/auth_interceptor.dart';

import '../../../../feature/authentication/data/local/source/share_preference/source.dart';

class ApiClient {
  final Dio dio;
  final AuthPreferenceSource authPreferenceSource;

  ApiClient(this.authPreferenceSource)
    : dio = Dio(
        BaseOptions(
          baseUrl: 'http://213.199.34.215/', // Example base URL
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          contentType: 'application/json',
          validateStatus: (status) {
            // Accept all status codes under 500 (so no exception for 401)
            return status != null && status < 500;
          },
        ),
      ) {
    dio.interceptors.add(AuthInterceptor(dio, authPreferenceSource));
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,   // 👈 Logs POST/PUT body
        responseBody: true,  // 👈 Logs response data
        responseHeader: true,
        error: true,

      ),
    );
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) async {
    return dio.get(path, queryParameters: queryParams);
  }

  Future<Response> post(String path, {dynamic data}) async {
    return dio.post(path, data: data);
  }
}
