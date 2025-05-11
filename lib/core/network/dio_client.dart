// lib/core/network/dio_client.dart

import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio.options.baseUrl = 'https://api.themoviedb.org/3';
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers['Authorization'] =
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjYzc1ZDI0ZjE4OWUwYjRjNWM1YTRhNDQ1ODRhOWU5ZSIsIm5iZiI6MTc0NTMwMTI4OC41NzEsInN1YiI6IjY4MDcyZjI4YjJiNzIyYWVkZjg5OWU1YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.q0h_PLOIPKNYi0QcFXmewt1f-jK6hReeyg3nPr4zBqo";
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add any request interceptors here
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Add any response interceptors here
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          // Handle errors here
          return handler.next(e);
        },
      ),
    );
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to load data: ${e.message}');
    }
  }
}
