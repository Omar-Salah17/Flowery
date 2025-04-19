import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';
import 'package:flowery/features/productsDetails/data/remote/product_details_remote_data_source.dart';
import 'package:flowery/features/productsDetails/domain/repository/get_product_details_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetProductDetailsContract)
class GetProductDetailsImpl implements GetProductDetailsContract {
  ProductDetailsRemoteDataSource remoteDataSource;
  GetProductDetailsImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Product>> getProductDetails(String producrId) async {
    try {
      final data = await remoteDataSource.getProductDetails(producrId);
      log("data in GetProductDetailsImpl $data");
      return Right(data.product ?? const Product());
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log('error in GetProductDetailsImpl: $e');
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
