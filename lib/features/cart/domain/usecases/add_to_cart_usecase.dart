import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/cart/data/models/add_product_request.dart';

import 'package:flowery/features/cart/data/models/add_product_response.dart';
import 'package:flowery/features/cart/domain/repos/add_to_cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUsecase {
  final AddToCartRepo addToCartRepo;
  AddToCartUsecase({required this.addToCartRepo});

  Future<Either<Failure, AddProductResponse>> invoke({
    required AddProductRequest addProductRequest,
  }) async {
    return await addToCartRepo.addToCart(addProductRequest: addProductRequest);
  }
}
