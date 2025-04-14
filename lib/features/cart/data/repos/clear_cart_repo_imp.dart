import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/cart/data/data%20sources/clear%20cart/clear_cart_data_source.dart';
import 'package:flowery/features/cart/data/models/clear%20cart%20models/clear_cart_response.dart';
import 'package:flowery/features/cart/domain/repos/clear%20cart/clear_cart_repo.dart';

import 'package:injectable/injectable.dart';

@Injectable(as: ClearCartRepo)
class ClearCartRepoImp extends ClearCartRepo {
  final ClearCartDataSource clearCartDataSource;

  ClearCartRepoImp({required this.clearCartDataSource});

  @override
  Future<Either<Failure, ClearCartResponse>> clearCart(String token) async {
    try {
      final result = await clearCartDataSource.clearCart(token);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
