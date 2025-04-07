import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/categories/data/models/products_model/product.dart';
import 'package:flowery/features/categories/domain/repos/categories_screen_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsByCategoryUseCase {
  final CategoriesScreenRepo getAllCategoriesRepo;
  GetProductsByCategoryUseCase({required this.getAllCategoriesRepo});

  Future<Either<Failure, List<Product>>> call({String? categoryId}) async {
    return await getAllCategoriesRepo.getProductsByCategory(categoryId: categoryId);
  }
}
