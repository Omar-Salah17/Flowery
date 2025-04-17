import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/cart/data/models/add_product_request.dart';
import 'package:flowery/features/cart/data/models/cart_model/cart_response.dart';

abstract class CartRepo {
   Future<Either<Failure,CartResponse>>addToCart({
    required AddProductRequest addProductRequest,
  });
  Future<Either<Failure,CartResponse>> clearCart();
  Future<Either<Failure,CartResponse>> updateProductQuantity({ required int productQuantity , required String productId});
  Future<Either<Failure,CartResponse>>getUserCart();
  Future<Either<Failure,CartResponse>> removeFromCart({required String productId});
}
