import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/cart/data/models/delete%20item%20models/delete_specific_item_response.dart';

abstract class DeleteCartItemRepo {
  Future<Either<Failure, DeleteCartResponse>> deleteCartItem({
    required String cartItemId,
  });
}
