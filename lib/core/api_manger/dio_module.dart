import 'package:dio/dio.dart';

import 'package:flowery/core/utils/constants.dart';
import 'package:flowery/core/utils/services/secure_sotrage_service.dart';
import 'package:injectable/injectable.dart';

import 'api_service.dart';

@module
abstract class DioModule {
  @Singleton()
  LogInterceptor provideLogger() {
    return LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
      error: true,
      request: true,
    );
  }

  @Singleton()
  Dio provideDio(
    LogInterceptor logInterceptor,
    SecureStorageService secureStorageService,
  ) {
    var dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        baseUrl: Constants.baseUrl,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await secureStorageService.readSecureData(
            Constants.userToken,
          );
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(logInterceptor);
    return dio;
  }

  @Singleton()
  ApiService provideApiService(Dio dio) {
    return ApiService(dio);
  }
}
