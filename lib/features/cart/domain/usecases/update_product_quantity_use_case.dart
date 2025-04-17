import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/cart/data/models/cart_model/cart_response.dart';
import 'package:flowery/features/cart/domain/repos/cart_repo.dart';

import 'package:injectable/injectable.dart';

@injectable
class UpdateProductQuantityUseCase {
  final CartRepo cartRepo;

  UpdateProductQuantityUseCase(this.cartRepo);

  Future<Either<Failure, CartResponse>> call({
    required String cartItemId,

    required int productQuantity,
  }) {
    return cartRepo.updateProductQuantity(
      productQuantity: productQuantity,
      productId: cartItemId,
    );
  }
}
