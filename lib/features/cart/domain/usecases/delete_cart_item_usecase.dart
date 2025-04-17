import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/cart/data/models/cart_model/cart_response.dart';

import 'package:flowery/features/cart/domain/repos/cart_repo.dart';

import 'package:injectable/injectable.dart';

@injectable
class DeleteCartItemUsecase {
  final CartRepo cartRepo;
  DeleteCartItemUsecase(this.cartRepo);

  Future<Either<Failure, CartResponse>> invoke({required String cartItemId}) {
    return cartRepo.removeFromCart(productId: cartItemId);
  }
}
