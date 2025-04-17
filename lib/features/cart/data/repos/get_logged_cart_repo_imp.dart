import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/cart/data/data%20sources/get%20logged/get_logged_data_source.dart';
import 'package:flowery/features/cart/data/models/get%20logged%20cart%20models/get_logged_cart_response.dart';
import 'package:flowery/features/cart/domain/repos/logged/get_logged_cart_repo.dart';

import 'package:injectable/injectable.dart';

@Injectable(as: GetLoggedCartRepo)
class GetLoggedCartRepoImp extends GetLoggedCartRepo {
  final GetLoggedCartDataSource dataSource;

  GetLoggedCartRepoImp({required this.dataSource});

  @override
  Future<Either<Failure, GetLoggedCartResponse>> getLoggedCart() async {
    try {
      final result = await dataSource.getLoggedCart();
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
