import 'package:dio/dio.dart';
import 'package:flowery/core/utils/constants.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';
import 'package:flowery/core/utils/models/products_model/products_model.dart';
import 'package:flowery/features/auth/login/data/models/login_request.dart'
    show LoginRequest;
import 'package:flowery/features/auth/login/data/models/login_respose.dart';
import 'package:flowery/features/auth/register/data/models/register_request.dart';
import 'package:flowery/features/auth/register/data/models/register_response.dart';
import 'package:flowery/features/best_seller/data/models/best_seller_model.dart';
import 'package:flowery/features/categories/data/models/categories_model/categories_model.dart';


import 'package:retrofit/retrofit.dart';

import '../../features/occasion/data/models/occaions.dart';
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
  

  @GET(Constants.occasionEndPoint)
  Future<AllOccaions> getAllOccasions();
  @GET(Constants.productsEndPoint)
  Future<ProductsModel> getAllProductByOccasion({
    @Query('occasion')  String? occasionId,
  });

  @GET(Constants.bestSellerEndPoint)
  Future<BestSellerModel> getBestSellerProduct();

  @GET("products")
  Future<Product> getProductDetails(@Query("id") String id);
  @GET(Constants.profileDataENdPoint)
  Future<User> getLoggedInUserData();
 

}
