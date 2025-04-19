import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flowery/core/utils/constants.dart';
import 'package:flowery/core/utils/services/secure_sotrage_service.dart';

Future<void> setToken() async {
  final Dio dio = Dio();
  final String? token = await SecureStorageService().readSecureData(
    Constants.userToken,
  );
  if (token != null && token.isNotEmpty) {
    dio.options.headers['Authorization'] = 'Bearer $token';
    log("------------");
    log(token);
    log("-----------------");
  }
}
