
import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/productsDetails/data/model/product_details_model.dart';

abstract class GetProductDetailsContract  {
  Future <Either<Failure,List<Product>>> GetProductDetails(String producrId);
}
