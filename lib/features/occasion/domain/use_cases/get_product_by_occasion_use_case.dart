import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/occasion/domain/repos/occasion_repository_contract.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/models/products_model/product.dart';

@injectable
class GetProductByOccasionUseCase {
  final OccasionRepositoryContract occasionRepositoryContract;

  GetProductByOccasionUseCase(this.occasionRepositoryContract);

  Future<Either<Failure, List<Product>>> invoke({
    required String occasionId,
  }) async {
    return await occasionRepositoryContract.getProductsByOccasion(occasionId);
  }
}
