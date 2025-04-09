import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/best_seller/data/data_source/best_seller_data_source.dart';
import 'package:flowery/features/best_seller/data/models/best_seller_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repos/best_seller_repo.dart';

@Injectable(as: BestSellerRepo)
class BestSellerRepoImpl implements BestSellerRepo {
  BestSellerDataSource bestSellerDataSource;

  BestSellerRepoImpl(this.bestSellerDataSource);

  @override
  Future<Either<Failure, BestSellerModel>> getBestSeller() async {
    try {
      var data = await bestSellerDataSource.getBestSellerProduct();
      // log("dataaaaa in GetAllCategoriesRepoImpl ${data.categories} ");
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log('error  ${e.toString()}');
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
