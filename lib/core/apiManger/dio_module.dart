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
          options.headers['Authorization'] =
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjc2YjMwYjUxZDc0NDM1MjVjNmZlZGJhIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NDQ3NTQ4MjJ9.U37QOqTvVE1muYJ9pp_oOUmCIcEHdEP7awvnkN2X5wk";

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
