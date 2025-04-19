import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';
import 'package:flowery/features/occasion/data/models/occaions.dart';
import 'package:flowery/features/occasion/domain/repos/occasion_remote_data_source_contract.dart';
import 'package:flowery/features/occasion/domain/repos/occasion_repository_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OccasionRepositoryContract)
class OccasionRepositoryImpl implements OccasionRepositoryContract {
  final OccasionRemoteDataSourceContract occasionRemoteDataSourceContract;
  OccasionRepositoryImpl({required this.occasionRemoteDataSourceContract});
  @override
  Future<Either<Failure, List<Occasions>>> getAllOccasions() async {
    final response = await occasionRemoteDataSourceContract.getAllOccasions();
    try {
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProductsByOccasion(
    String? occasionId,
  ) async {
    final response = await occasionRemoteDataSourceContract.getProductsByOccasion(
      occasionId: occasionId,
    );
    try {
      // log("dataaaaa in CategoriesScreenRepoImpl ${data.products} ");
      return Right(response.products ?? []);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log(
          'error in CategoriesScreenRepoImpl getProductsByCategory method: $e',
        );
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
