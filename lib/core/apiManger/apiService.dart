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
import 'package:flowery/features/cart/data/models/add_product_request.dart';
import 'package:flowery/features/cart/data/models/add_product_response.dart';
import 'package:flowery/features/cart/data/models/clear%20cart%20models/clear_cart_response.dart';
import 'package:flowery/features/cart/data/models/delete%20item%20models/delete_specific_item_response.dart';
import 'package:flowery/features/cart/data/models/get%20logged%20cart%20models/get_logged_cart_response.dart';
import 'package:flowery/features/cart/data/models/update%20product%20models/update_product_request.dart';
import 'package:flowery/features/cart/data/models/update%20product%20models/update_product_response.dart';
import 'package:flowery/features/categories/data/models/categories_model/categories_model.dart';
import 'package:flowery/features/productsDetails/data/models/product_details_model/product_details_model.dart';
import 'package:flowery/features/profile/data/model/user_response.dart';
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

  @POST(Constants.addToCartEndPoint)
  Future<AddProductResponse> addToCart(
    @Body() AddProductRequest addProductRequest,
  );

  @GET(Constants.getLoggedCart)
  Future<GetLoggedCartResponse> getLoggedCart();

  @DELETE(Constants.deleteSpecificCartItem)
  Future<DeleteCartResponse> deleteCartItem(
    @Path("cartItemId") String cartItemId,
  );

  @DELETE(Constants.clearCart)
  Future<ClearCartResponse> clearCart();

  @PUT("cart/{id}")
  Future<UpdateCartResponse> updateCartProductQuantity(
    @Path("id") String cartItemId,
    @Body() UpdateProductRequest request,
  );

  @GET(Constants.occasionEndPoint)
  Future<AllOccaions> getAllOccasions();
  @GET(Constants.productsEndPoint)
  Future<ProductsModel> getAllProductByOccasion({
    @Query('occasion') String? occasionId,
  });

  @GET(Constants.bestSellerEndPoint)
  Future<BestSellerModel> getBestSellerProduct();


  @GET(Constants.logoutEndPoint)
  Future<String> logout();
  
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
