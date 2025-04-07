import 'package:dio/dio.dart';
import 'package:flowery/core/utils/constants.dart';
import 'package:flowery/features/auth/register/data/models/register_request.dart';
import 'package:flowery/features/auth/register/data/models/register_response.dart';
import 'package:flowery/features/categories/data/models/categories_model/categories_model.dart';
import 'package:flowery/features/categories/data/models/products_model/products_model.dart';
import 'package:retrofit/retrofit.dart';
part 'apiService.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST('auth/signup')
  Future<RegisterResponse> registerUser(
    @Body() RegisterRequest registerRequest,
  );
  @GET(Constants.categoriesEndPoint)
  Future<CategoriesModel> getCategories();
  @GET(Constants.productsEndPoint)
  Future<ProductsModel> getProductsByCategory({
    @Query("category") String? categoryId
  });

}
