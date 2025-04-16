import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flowery/core/utils/constants.dart';
import 'package:flowery/core/utils/models/products_model/products_model.dart';
import 'package:flowery/features/auth/login/data/models/login_request.dart'
    show LoginRequest;
import 'package:flowery/features/auth/login/data/models/login_respose.dart';
import 'package:flowery/features/auth/register/data/models/register_request.dart';
import 'package:flowery/features/auth/register/data/models/register_response.dart';
import 'package:flowery/features/best_seller/data/models/best_seller_model.dart';
import 'package:flowery/features/categories/data/models/categories_model/categories_model.dart';
import 'package:flowery/features/productsDetails/data/models/product_details_model/product_details_model.dart';
import 'package:flowery/features/profile/data/model/user_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:http_parser/http_parser.dart';


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
    @Query('occasion') String? occasionId,
  });

  @GET(Constants.bestSellerEndPoint)
  Future<BestSellerModel> getBestSellerProduct();


  @GET(Constants.logoutEndPoint)
  Future<String> logout(@Header('Authorization') String token);
  
  @GET("products/{id}")
Future<ProductDetailsModel> getProductDetails(@Path("id") String id);

  @PUT(Constants.editProfileEndPoint)
  Future<UserResponse>editProfile(
      @Body() UpdatedUserModel user,
      );
  @GET(Constants.profileDataENdPoint)
  Future<UserResponse> getLoggedInUserData();

  @MultiPart()
  @PUT(Constants.uploadPhotoEndPoint)
  Future<String> uploadPhoto(
      @Part(name: "photo") File image,
      );

}
