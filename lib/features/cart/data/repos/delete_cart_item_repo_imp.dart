import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/cart/data/data%20sources/delete%20cart%20item/delete_cart_item_data_source.dart';
import 'package:flowery/features/cart/data/models/delete%20item%20models/delete_specific_item_response.dart';
import 'package:flowery/features/cart/domain/repos/delete%20item/delete_cart_item_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: DeleteCartItemRepo)
class DeleteCartItemRepoImp extends DeleteCartItemRepo {
  final DeleteCartItemDataSource dataSource;
  DeleteCartItemRepoImp({required this.dataSource});

  @override
  Future<Either<Failure, DeleteCartResponse>> deleteCartItem({
    required String token,
    required String cartItemId,
  }) async {
    try {
      final result = await dataSource.deleteCartItem(
        token: token,
        cartItemId: cartItemId,
      );
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
