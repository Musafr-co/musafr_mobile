import 'package:dio/dio.dart';
import 'package:musafr/core/network/data/interceptor/auth_interceptor.dart';

class ApiClient {
  final Dio dio;

  ApiClient()
      : dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com', // Example base URL
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      contentType: 'application/json',
    ),
  ) {
    dio.interceptors.add(AuthInterceptor(dio));
    dio.interceptors.add(LogInterceptor(responseBody: true)); // Optional logging
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) async {
    return dio.get(path, queryParameters: queryParams);
  }

  Future<Response> post(String path, {dynamic data}) async {
    return dio.post(path, data: data);
  }

// Add put, delete, etc. as needed
}
