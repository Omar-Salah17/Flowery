import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/occasion/data/repos/occasion_repository_impl.dart';
import 'package:flowery/features/occasion/domain/repos/occasion_repository_contract.dart';
import 'package:flowery/features/occasion/domain/use_cases/get_all_occasions_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/models/products_model/product.dart';
@injectable
class GetProductByOccasionUsecase {
  final OccasionRepositoryContract occasionRepositoryContract;

  GetProductByOccasionUsecase(this.occasionRepositoryContract);

Future<Either<Failure, List<Product>>>  invoke({required String occasionId}) async {
  return   await occasionRepositoryContract.getProductsByOccasion(
      occasionId
    );
  }
}
