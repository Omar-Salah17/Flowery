import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/cart/data/models/delete%20item%20models/delete_specific_item_response.dart';
import 'package:flowery/features/cart/domain/repos/delete%20item/delete_cart_item_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteCartItemUsecase {
  final DeleteCartItemRepo repo;
  DeleteCartItemUsecase({required this.repo});

  Future<Either<Failure, DeleteCartResponse>> invoke({
    required String cartItemId,
  }) {
    return repo.deleteCartItem(cartItemId: cartItemId);
  }
}
