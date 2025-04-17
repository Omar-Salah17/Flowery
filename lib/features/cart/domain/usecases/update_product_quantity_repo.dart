import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/cart/data/models/update%20product%20models/update_product_request.dart';
import 'package:flowery/features/cart/data/models/update%20product%20models/update_product_response.dart';
import 'package:flowery/features/cart/domain/repos/update%20product%20cart/update_product_cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateCartItemUseCase {
  final UpdateProductCartRepo repo;

  UpdateCartItemUseCase(this.repo);

  Future<Either<Failure, UpdateCartResponse>> call({
    required String cartItemId,

    required UpdateProductRequest request,
  }) {
    return repo.updateCartItem(cartItemId, request);
  }
}
