import 'package:dartz/dartz.dart';
import 'package:flowery/features/categories/data/models/categories_model/categories_model.dart';
import 'package:flowery/features/home/data/models/CategoriesResponse.dart';

import '../../../../core/utils/error_handler.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, CategoriesModel>> getCategories();
}
