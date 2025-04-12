import 'package:flowery/core/utils/models/products_model/product.dart';

abstract class RemoteDataSource {
  Future<Product> getProductDetails(String producrId);
}
