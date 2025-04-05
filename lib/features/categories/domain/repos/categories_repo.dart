import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/categories/data/models/categories_model/category.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, List<Category>>> getAllCategories();
}
