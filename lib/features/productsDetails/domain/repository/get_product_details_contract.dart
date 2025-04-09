
import 'package:flowery/features/productsDetails/data/model/product_details_model.dart';

abstract class GetProductDetailsContract  {
  Future <List<ProductModel>> GetProductDetails(String id);
}
