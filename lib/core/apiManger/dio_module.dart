import 'package:dio/dio.dart';
import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/core/utils/constants.dart';
import 'package:injectable/injectable.dart';

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
  Dio provideDio(LogInterceptor logInterceptor) {
    var dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        baseUrl: Constants.baseUrl,
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['Authorization'] = Constants.userToken;

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
