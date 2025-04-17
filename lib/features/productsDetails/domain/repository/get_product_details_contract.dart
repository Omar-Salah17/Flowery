import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';

abstract class GetProductDetailsContract {
  Future<Either<Failure, Product>> getProductDetails(String producrId);
}
