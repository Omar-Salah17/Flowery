import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/cart/data/data%20sources/add_to_cart_data_source.dart';
import 'package:flowery/features/cart/data/models/add_product_request.dart';
import 'package:flowery/features/cart/data/models/add_product_response.dart';
import 'package:flowery/features/cart/domain/repos/add_to_cart_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddToCartRepo)
class AddToCartRepoImp extends AddToCartRepo {
  final AddToCartDataSource addToCartDataSource;
  AddToCartRepoImp({required this.addToCartDataSource});
  @override
  Future<Either<Failure, AddProductResponse>> addToCart({
    required AddProductRequest addProductRequest,
  }) async {
    try {
      var data = await addToCartDataSource.addTOCart(
        addProductRequest: addProductRequest,
      );
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
