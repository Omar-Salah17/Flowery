import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/cart/data/models/add_product_request.dart';
import 'package:flowery/features/cart/data/models/cart_model/cart_response.dart';
import 'package:flowery/features/cart/domain/repos/cart_repo.dart';

import 'package:injectable/injectable.dart';

@injectable
class AddToCartUsecase {
  final CartRepo cartRepo;
  AddToCartUsecase({required this.cartRepo});
  Future<Either<Failure, CartResponse>> invoke({
    required AddProductRequest addProductRequest,
  }) async {
    return await cartRepo.addToCart(addProductRequest: addProductRequest);
  }
}
