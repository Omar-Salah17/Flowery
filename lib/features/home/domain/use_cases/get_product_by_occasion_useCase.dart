import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/home/data/models/product_response_model.dart';
import 'package:flowery/features/home/domain/repository/product_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetProductByOccasionUsecase {
  final ProductRepositoryContract productRepository;

  GetProductByOccasionUsecase(this.productRepository);

Future<Either<Failure, List<Products>>>  invoke({required String occasionId}) async {
    var eirher=  await productRepository.getAllProductByOccasion(
      occasionId: occasionId,
    );
    return eirher.fold((l) => Left(l), (r) => Right(r));
  }
}
