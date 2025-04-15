import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';
import 'package:flowery/features/productsDetails/data/models/product_details_model/product_details_model.dart';
import 'package:flowery/features/productsDetails/domain/repository/get_product_details_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductDetailsUseCase {
  GetProductDetailsContract getProductDetailsContract;
  GetProductDetailsUseCase(this.getProductDetailsContract);

  Future<Either<Failure, Product>> getProductDetails(
    String producrId,
  ) async {
    return await getProductDetailsContract.getProductDetails(producrId);
  }
}
