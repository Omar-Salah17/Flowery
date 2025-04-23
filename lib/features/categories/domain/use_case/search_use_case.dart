import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';
import 'package:flowery/features/categories/domain/repos/categories_screen_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchUseCase {
  final CategoriesScreenRepo getAllCategoriesRepo;
  SearchUseCase({required this.getAllCategoriesRepo});

  Future<Either<Failure, List<Product>>> call({String? categoryId, String? keyword}) async {
    return await getAllCategoriesRepo.getProductsByCategory(
      categoryId: categoryId,
      keyword: keyword
    );
  }
}
