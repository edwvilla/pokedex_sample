import 'package:dio/dio.dart';

Dio get networkClient {
  const url = "https://pokeapi.co/api/v2/";

  final dio = Dio(
    BaseOptions(
      baseUrl: url,
    ),
  );

  dio.interceptors.add(
    LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ),
  );

  dio.interceptors.add(
    LogInterceptor(),
    // Add custom interceptors if needed
  );

  return dio;
}
