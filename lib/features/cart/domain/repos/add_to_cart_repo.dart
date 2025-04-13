import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/cart/data/models/add_product_request.dart';
import 'package:flowery/features/cart/data/models/add_product_response.dart';

abstract class AddToCartRepo {
  Future<Either<Failure, AddProductResponse>> addToCart({
    required AddProductRequest addProductRequest,
  });
}
