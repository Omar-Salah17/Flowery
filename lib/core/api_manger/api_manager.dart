
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flowery/core/utils/constants.dart';
import 'package:flowery/core/utils/helper_functions/set_token_function.dart';
import 'package:flowery/core/utils/services/secure_sotrage_service.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: Constants.baseUrl,

      headers: {'Content-Type': 'application/json'},
    ),
  );
 ApiManager() {
  setToken();
  }
  setToken() async {
    final String? token = await SecureStorageService().readSecureData(
      Constants.userToken,
    );
    if (token != null && token.isNotEmpty) {
      dio.options.headers['Authorization'] = 'Bearer $token';
      log("Token Set: $token");
    }
  }
  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? params,
  }) {
    final response = dio.get(endPoint, queryParameters: params);
    return response;
  }

  Future<Response> postData({
    required String endPoint,
    required Map<String, dynamic> data,
  }) {
    final response = dio.post(endPoint, data: data);
    return response;
  }

  Future<Response> putRequest(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    final response = await dio.put(endpoint, data: data);
    return response;
  }

  Future<Response> patchRequest(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
     await setToken();
    final response = await dio.patch(endpoint, data: data);
    return response;
  }

  Future<Response> deleteRequest(String endpoint) async {
    final response = await dio.delete(endpoint);
    return response.data as Response;
  }
}
