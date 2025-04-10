import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/productsDetails/data/model/product_details_model.dart';
import 'package:flowery/features/productsDetails/data/remote/remote_data_source.dart';
import 'package:flowery/features/productsDetails/domain/repository/get_product_details_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetProductDetailsContract)
class GetProductDetailsImpl implements GetProductDetailsContract {
  RemoteDataSource remoteDataSource;
  GetProductDetailsImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Product>>> GetProductDetails(
    String producrId,
  ) async {
    try {
      var data = await remoteDataSource.GetProductDetails(producrId);
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log('error in GetProductDetailsImpl: ${e.toString()}');
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
