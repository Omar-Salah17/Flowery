import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/cart/data/models/cart_model/cart_response.dart';
import 'package:flowery/features/cart/domain/repos/cart_repo.dart';

import 'package:injectable/injectable.dart';

@injectable
class ClearCartUsecase {
  final CartRepo cartRepo;

  ClearCartUsecase(this.cartRepo);

  Future<Either<Failure, CartResponse>> invoke() {
    return cartRepo.clearCart();
  }
}
