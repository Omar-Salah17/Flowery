import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/categories/data/data_source/categories_remote_data_source.dart';
import 'package:flowery/features/categories/data/models/categories_model/category.dart';
import 'package:flowery/features/categories/domain/repos/categories_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRepo)
class CategoriesRepoImpl implements CategoriesRepo {
  final CategoriesRemoteDataSource categoriesRemoteDataSource;

  CategoriesRepoImpl({required this.categoriesRemoteDataSource});
  @override
  Future<Either<Failure, List<Category>>> getAllCategories() async {
    try {
      var data = await categoriesRemoteDataSource.getCategories();
      // log("dataaaaa in GetAllCategoriesRepoImpl ${data.categories} ");
      return Right(data.categories ?? []);
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
