
import 'package:flowery/features/productsDetails/data/model/product_details_model.dart';

abstract class RemoteDataSource {
  Future<List<ProductsModel>> GetProductDetails(String producrId);
}