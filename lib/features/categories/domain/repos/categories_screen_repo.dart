import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';
import 'package:flowery/features/categories/data/models/categories_model/category.dart';

abstract class CategoriesScreenRepo {
  Future<Either<Failure, List<Category>>> getAllCategories();
  Future<Either<Failure, List<Product>>> getProductsByCategory({
    String? categoryId,
  });
}
