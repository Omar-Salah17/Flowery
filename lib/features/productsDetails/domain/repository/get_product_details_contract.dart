import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';
import 'package:flowery/features/productsDetails/data/models/product_details_model/product_details_model.dart';

abstract class GetProductDetailsContract {

  Future<Either<Failure, Product>> getProductDetails(
    String producrId,
  );
}
