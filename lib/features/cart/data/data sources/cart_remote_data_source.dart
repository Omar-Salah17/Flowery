import 'package:flowery/features/cart/data/models/add_product_request.dart';
import 'package:flowery/features/cart/data/models/cart_model/cart_response.dart';

abstract class CartRemoteDataSource {
  Future<CartResponse> addToCart({
    required AddProductRequest addProductRequest,
  });
  Future<CartResponse> clearCart();
  Future<CartResponse> updateProductQuantity({required int productQuantity , required String productId});
  Future<CartResponse> getUserCart();
  Future<CartResponse> removeFromCart({required String productId});
}
