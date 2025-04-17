import 'package:flowery/features/cart/data/models/add_product_request.dart';
import 'package:flowery/features/cart/data/models/add_product_response.dart';

abstract class AddToCartDataSource {
  Future<AddProductResponse> addTOCart({
    required AddProductRequest addProductRequest,
  });
}
