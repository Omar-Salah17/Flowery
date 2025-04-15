import 'package:dartz/dartz.dart';
import 'package:flowery/features/cart/data/models/update%20product%20models/update_product_request.dart';
import 'package:flowery/features/cart/data/models/update%20product%20models/update_product_response.dart';

abstract class UpdateProductCartRepo {
  Future<Either<String, UpdateCartResponse>> updateCartItem(
    String cartItemId,
    UpdateProductRequest request,
  );
}
