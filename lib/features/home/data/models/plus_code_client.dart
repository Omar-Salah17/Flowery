import 'package:dio/dio.dart';
import 'package:flowery/features/home/data/models/plus_code_response.dart';
import 'package:retrofit/retrofit.dart';

part 'plus_code_client.g.dart';

@RestApi(baseUrl: "https://plus.codes/")
abstract class PlusCodeClient {
  factory PlusCodeClient(Dio dio, {String baseUrl}) = _PlusCodeClient;

  @GET("/api")
  Future<PlusCodeResponse> getPlusCode(@Query("address") String coordinates);
}
