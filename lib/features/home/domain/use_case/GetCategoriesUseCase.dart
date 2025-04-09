import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/categories/data/models/categories_model/categories_model.dart';
import 'package:flowery/features/home/data/models/CategoriesResponse.dart';
import 'package:flowery/features/home/domain/repository/CategoriesRepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUseCase {
  CategoriesRepo categoriesRepo;

  GetCategoriesUseCase(this.categoriesRepo);

  Future<Either<Failure, CategoriesModel>> call() async {
    return await categoriesRepo.getCategories();
  }
}
