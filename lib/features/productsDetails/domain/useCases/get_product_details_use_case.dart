import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/productsDetails/data/model/product_details_model.dart';
import 'package:flowery/features/productsDetails/domain/repository/get_product_details_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductDetailsUseCase {
  GetProductDetailsContract getProductDetailsContract;
  GetProductDetailsUseCase(this.getProductDetailsContract);

  Future<Either<Failure, List<Product>>> GetProductDetails(
    String producrId,
  ) async {
    return await getProductDetailsContract.GetProductDetails(producrId);
  }
}
