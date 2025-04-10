import 'package:dio/dio.dart';
import 'package:flowery/core/utils/constants.dart';
import 'package:flowery/features/auth/register/data/models/register_request.dart';
import 'package:flowery/features/auth/register/data/models/register_response.dart';
import 'package:flowery/features/productsDetails/data/model/product_details_model.dart';
import 'package:retrofit/retrofit.dart';
part  'apiService.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
   
  @POST('auth/signup')
  Future<RegisterResponse> registerUser(@Body() RegisterRequest registerRequest);

  @GET("products")
  Future<ProductsModel> getProductDetails(@Query("id") String id);
 

}
