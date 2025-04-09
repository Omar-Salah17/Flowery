import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/home/data/dataSource/homeBestSellersDataSource.dart';
import 'package:flowery/features/home/data/models/best-seller_response.dart';
import 'package:flowery/features/home/domain/repos/bestSellerRepo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BestSellerRepo)
class BestSellerRepoImp implements BestSellerRepo {
  final Homebestsellersdatasource homebestsellersdatasource;
  BestSellerRepoImp({required this.homebestsellersdatasource});
  @override
  Future<Either<Failure, List<BestSeller>>> getBestSellers() async {
    try {
      var data = await homebestsellersdatasource.fetchHomeBestSellers();
      return Right(data.bestSeller ?? []);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log('error in GetAllCategoriesRepoImpl: ${e.toString()}');
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
