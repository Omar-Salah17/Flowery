import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/cart/data/models/cart_model/cart_response.dart';
import 'package:flowery/features/cart/domain/repos/cart_repo.dart';

import 'package:injectable/injectable.dart';

@injectable
class GetUserCartUsecase {
  final CartRepo cartRepo;

  GetUserCartUsecase(this.cartRepo);

  Future<Either<Failure, CartResponse>> invoke() async {
    return await cartRepo.getUserCart();
  }
}
