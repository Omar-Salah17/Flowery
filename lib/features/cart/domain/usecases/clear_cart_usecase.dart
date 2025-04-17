import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/cart/data/models/clear%20cart%20models/clear_cart_response.dart';
import 'package:flowery/features/cart/domain/repos/clear%20cart/clear_cart_repo.dart';

import 'package:injectable/injectable.dart';

@injectable
class ClearCartUsecase {
  final ClearCartRepo clearCartRepo;

  ClearCartUsecase({required this.clearCartRepo});

  Future<Either<Failure, ClearCartResponse>> invoke() {
    return clearCartRepo.clearCart();
  }
}
