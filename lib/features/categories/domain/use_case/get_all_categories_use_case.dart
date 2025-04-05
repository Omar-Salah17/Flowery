import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/categories/data/models/categories_model/category.dart';
import 'package:flowery/features/categories/domain/repos/categories_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCategoriesUseCase {
  final CategoriesRepo getAllCategoriesRepo;

  GetAllCategoriesUseCase({required this.getAllCategoriesRepo});

  Future<Either<Failure, List<Category>>> call() async {
    return await getAllCategoriesRepo.getAllCategories();
  }
}
