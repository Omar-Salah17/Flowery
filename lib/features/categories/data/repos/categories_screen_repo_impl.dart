import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/categories/data/data_source/categories_screen_remote_data_source.dart';
import 'package:flowery/features/categories/data/models/categories_model/category.dart';
import 'package:flowery/features/categories/data/models/products_model/product.dart';
import 'package:flowery/features/categories/domain/repos/categories_screen_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesScreenRepo)
class CategoriesScreenRepoImpl implements CategoriesScreenRepo {
  final CategoriesScreenRemoteDataSource categoriesRemoteDataSource;

  CategoriesScreenRepoImpl({required this.categoriesRemoteDataSource});
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
        log('error in CategoriesScreenRepoImpl getCategories method: ${e.toString()}');
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProductsByCategory({
    String? categoryId,
  }) async {
    try {
      final data = await categoriesRemoteDataSource.getProductsByCategory(
        categoryId: categoryId,
      );
      // log("dataaaaa in CategoriesScreenRepoImpl ${data.products} ");
      return Right(data.products ?? []);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
         log('error in CategoriesScreenRepoImpl getProductsByCategory method: ${e.toString()}');
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
