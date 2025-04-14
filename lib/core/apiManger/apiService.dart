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
import 'package:flowery/features/cart/data/models/add_product_request.dart';
import 'package:flowery/features/cart/data/models/add_product_response.dart';
import 'package:flowery/features/cart/data/models/clear%20cart%20models/clear_cart_response.dart';
import 'package:flowery/features/cart/data/models/delete%20item%20models/delete_specific_item_response.dart';
import 'package:flowery/features/cart/data/models/get%20logged%20cart%20models/get_logged_cart_response.dart';
import 'package:flowery/features/cart/data/models/update%20product%20models/update_product_request.dart';
import 'package:flowery/features/cart/data/models/update%20product%20models/update_product_response.dart';
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

  @POST(Constants.addToCartEndPoint)
  Future<AddProductResponse> addToCart(
    @Body() AddProductRequest addProductRequest,
  );

  @GET(Constants.loginEndPoint)
  Future<GetLoggedCartResponse> getLoggedCart(
    @Header("Authorization") String token,
  );

  @DELETE(Constants.deleteSpecificCartItem)
  Future<DeleteCartResponse> deleteCartItem(
    @Path("cartItemId") String token,
    @Header("Authorization") String cartItemId,
  );

  @DELETE(Constants.clearCart)
  Future<ClearCartResponse> clearCart(@Header("Authorization") String token);

  @PUT(Constants.updatCartProductQuantity)
  Future<UpdateCartResponse> updateCartProductQuantity(
    @Path("cartItemId") String cartItemId,
    @Header("Authorization") String token,
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

  @GET("products")
  Future<Product> getProductDetails(@Query("id") String id);
}
