import 'package:dio/dio.dart';

import 'logger.dart';

final String baseUrl = "https://rickandmortyapi.com/api/";

final Dio dio = Dio(
  BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    sendTimeout: const Duration(seconds: 10),
    headers: {'Accept': 'application/json', 'Content-Type': 'application/json'},
    responseType: ResponseType.json,
    followRedirects: true,
    validateStatus: (status) => status != null && status < 500,
    receiveDataWhenStatusError: true,
  ),
);

void setupDioLogging() {
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        logger.i('REQUEST[${options.method}] => PATH: ${options.path}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        logger.i('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        logger.e('ERROR[${e.response?.statusCode}] => MESSAGE: ${e.message}');
        return handler.next(e);
      },
    ),
  );
}
