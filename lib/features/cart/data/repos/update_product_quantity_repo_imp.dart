import 'package:dartz/dartz.dart';
import 'package:flowery/features/cart/data/data%20sources/update%20product%20quantity/update_product_data_source.dart';
import 'package:flowery/features/cart/data/models/update%20product%20models/update_product_request.dart';
import 'package:flowery/features/cart/data/models/update%20product%20models/update_product_response.dart';
import 'package:flowery/features/cart/domain/repos/update%20product%20cart/update_product_cart_repo.dart';

class UpdateProductQuantityRepoImp implements UpdateProductCartRepo {
  final UpdateProductDataSource updateProductDataSource;

  UpdateProductQuantityRepoImp({required this.updateProductDataSource});
  @override
  Future<Either<String, UpdateCartResponse>> updateCartItem(
    String cartItemId,
    String token,
    UpdateProductRequest request,
  ) async {
    try {
      final result = await updateProductDataSource.updateCartItem(
        cartItemId,
        token,
        request,
      );
      return Right(result);
    } catch (e) {
      return Left("Failed to update cart item: $e");
    }
  }
}
