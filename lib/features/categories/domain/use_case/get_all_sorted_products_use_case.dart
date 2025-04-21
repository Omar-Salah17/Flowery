import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';
import 'package:flowery/features/categories/domain/repos/categories_screen_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsByCategoryWithSortUseCase {
  final CategoriesScreenRepo repo;

  GetProductsByCategoryWithSortUseCase({required this.repo});

  Future<Either<Failure, List<Product>>> call({
    String? categoryId,
    String? sort,
  }) async {
    return await repo.getProductsByCategory(categoryId: categoryId, sort: sort);
  }
}
