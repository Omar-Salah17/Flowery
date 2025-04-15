import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';

import '../../data/models/occaions.dart';

abstract class OccasionRepositoryContract {
  Future<Either<Failure, List<Occasions>>> getAllOccasions();

  Future<Either<Failure, List<Product>>> getProductsByOccasion(
    String? occasionId,
  );
}
