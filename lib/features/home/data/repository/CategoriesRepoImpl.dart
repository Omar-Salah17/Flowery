import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/home/data/DataSource/CategoriesDataSource.dart';
import 'package:flowery/features/home/data/models/CategoriesResponse.dart';
import 'package:flowery/features/home/domain/repository/CategoriesRepo.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: CategoriesRepo)
class CategoriesRepoImpl implements CategoriesRepo{
  CategoriesDataSource categoriesDataSource;
  CategoriesRepoImpl(this.categoriesDataSource);
  @override
  Future<Either<Failure, CategoriesResponse>> getCategories()async {
    try {
      var response = await categoriesDataSource.getCategories();
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}