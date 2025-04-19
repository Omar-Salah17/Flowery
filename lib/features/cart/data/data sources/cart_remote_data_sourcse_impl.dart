
import 'package:flowery/features/cart/data/data%20sources/cart_remote_data_source.dart';
import 'package:flowery/features/cart/data/models/add_product_request.dart';
import 'package:flowery/features/cart/data/models/cart_model/cart_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api_manger/api_service.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourcseImpl implements CartRemoteDataSource {
  final ApiService apiService;

  CartRemoteDataSourcseImpl({required this.apiService});
  @override
  Future<CartResponse> addToCart({
    required AddProductRequest addProductRequest,
  }) async {
    var response = await apiService.addToCart(addProductRequest);
    return response;
  }

  @override
  Future<CartResponse> clearCart() async {
    var response = await apiService.clearCart();
    return response;
  }

  @override
  Future<CartResponse> getUserCart() async {
    var response = await apiService.getUserCart();
    return response;
  }

  @override
  Future<CartResponse> removeFromCart({required String productId}) async {
    var response = await apiService.deleteCartItem(productId);
    return response;
  }

  @override
  Future<CartResponse> updateProductQuantity({
    required String productId,
    required int productQuantity,
  }) async {
    var response = await apiService.updateCartProductQuantity(
      productId,
        {
        "quantity": productQuantity,
      },
    );
    return response;
  }
}
