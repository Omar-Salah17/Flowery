import 'package:flowery/features/productsDetails/data/models/product_details_model/product_details_model.dart';

abstract class ProductDetailsRemoteDataSource {
  Future<ProductDetailsModel> getProductDetails(String producrId);
}
