import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/cart/data/data%20sources/cart_remote_data_source.dart';
import 'package:flowery/features/cart/data/models/add_product_request.dart';
import 'package:flowery/features/cart/data/models/cart_model/cart_response.dart';
import 'package:flowery/features/cart/domain/repos/cart_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepo)
class CartRepoImpl implements CartRepo {
  final CartRemoteDataSource cartRemoteDataSource;

CartRepoImpl({required this.cartRemoteDataSource});
  @override
  Future<Either<Failure, CartResponse>> addToCart({
    required AddProductRequest addProductRequest,
  }) async {
    try {
      var data = await cartRemoteDataSource.addToCart(
        addProductRequest: addProductRequest,
      );
      return right(data);
    } catch (e) {
      if (e is DioException) {
        print( "Dioooooooooooo${e.toString()}");
        return left(ServerFailure.fromDioException(e));

      } else {
        log("error in CartRepoImpl addToCart method: ${e.toString()}");
        ///
        print( "notDioooooooooooo${e.toString()}");
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CartResponse>> clearCart() async {
    try {
      var data = await cartRemoteDataSource.clearCart();
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log("error in CartRepoImpl clearCart method: ${e.toString()}");
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CartResponse>> getUserCart() async {
    try {
      var data = await cartRemoteDataSource.getUserCart();
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log("error in CartRepoImpl getUserCart method: ${e.toString()}");
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CartResponse>> removeFromCart({
    required String productId,
  }) async {
    try {
      var data = await cartRemoteDataSource.removeFromCart(
        productId: productId,
      );
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log("error in CartRepoImpl removeFromCart method: ${e.toString()}");
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CartResponse>> updateProductQuantity({
  required int productQuantity,
    required String productId,
  }) async {
    try {
      var data = await cartRemoteDataSource.updateProductQuantity(
        productId: productId,
        productQuantity: productQuantity,

      );
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log("error in CartRepoImpl updateProductQuantity method: ${e.toString()}");
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
