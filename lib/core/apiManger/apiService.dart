import 'package:dio/dio.dart';
import 'package:flowery/core/utils/constants.dart';
import 'package:flowery/features/auth/login/data/models/login_request.dart'
    show LoginRequest;
import 'package:flowery/features/auth/login/data/models/login_respose.dart';
import 'package:flowery/features/auth/register/data/models/register_request.dart';
import 'package:flowery/features/auth/register/data/models/register_response.dart';
import 'package:flowery/features/best_seller/data/models/best_seller_model.dart';
import 'package:flowery/features/categories/data/models/categories_model/categories_model.dart';
import 'package:flowery/features/categories/data/models/products_model/products_model.dart';
import 'package:flowery/features/home/data/models/occaions.dart';
import 'package:flowery/features/home/data/models/product_response_model.dart';
import 'package:flowery/features/home/data/models/best-seller_response.dart';
import 'package:flowery/features/home/data/models/occasions_response.dart';
import 'package:flowery/features/home/data/models/CategoriesResponse.dart';
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
    @Query("category") String? categoryId,
  });

  @POST(Constants.loginEndPoint)
  Future<LoginResponse> loginUser(@Body() LoginRequest loginRequest);
  @GET(Constants.bestSellerEndPoint)
  Future<BestSellerResponse> getBestSellers();

  @GET(Constants.homeOccasions)
  Future<OcaasionsResponse> getHomeOccasions();
  @GET(Constants.occasionEndPoint)
  Future<AllOccaions> getAllOccasions();
  @GET(Constants.productsEndPoint)
  Future<ProductResponseModel> getAllProductByOccasion({
    @Query('occasion') required String occasionId,
  });

  @GET(Constants.bestSellerEndPoint)
  Future<BestSellerModel> getBestSellerProduct();
}
