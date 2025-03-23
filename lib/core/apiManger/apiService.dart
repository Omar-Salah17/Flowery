import 'package:dio/dio.dart';
import 'package:flowery/core/utils/constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apiService.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
}
