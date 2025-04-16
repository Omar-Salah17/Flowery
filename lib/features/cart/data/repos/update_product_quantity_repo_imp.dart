import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/cart/data/data%20sources/update%20product%20quantity/update_product_data_source.dart';
import 'package:flowery/features/cart/data/models/update%20product%20models/update_product_request.dart';
import 'package:flowery/features/cart/data/models/update%20product%20models/update_product_response.dart';
import 'package:flowery/features/cart/domain/repos/update%20product%20cart/update_product_cart_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UpdateProductCartRepo)
class UpdateProductQuantityRepoImp implements UpdateProductCartRepo {
  final UpdateProductDataSource updateProductDataSource;

  UpdateProductQuantityRepoImp({required this.updateProductDataSource});
  @override
  Future<Either<Failure, UpdateCartResponse>> updateCartItem(
    String cartItemId,
    UpdateProductRequest request,
  ) async {
    try {
      final result = await updateProductDataSource.updateCartItem(
        cartItemId,
        request,
      );
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
