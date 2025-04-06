import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flowery/core/utils/constants.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: Constants.baseUrl,

      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? params,
  }) async {
    var response = dio.get(endPoint, queryParameters: params);
    return response;
  }

  Future<Response> postData({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    log(endPoint);
    var response = dio.post(endPoint, data: data);
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
    final response = await dio.patch(endpoint, data: data);
    return response;
  }

  Future<Response> deleteRequest(String endpoint) async {
    final response = await dio.delete(endpoint);
    return response.data;
  }
}
