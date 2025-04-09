import 'package:flowery/features/productsDetails/data/model/product_details_model.dart';
import 'package:flowery/features/productsDetails/domain/repository/get_product_details_contract.dart';

abstract class GetProductDetailsUseCase {
  GetProductDetailsContract getProductDetailsContract;
  GetProductDetailsUseCase(this.getProductDetailsContract);
  Future <List<ProductModel>> GetProductDetails(String id){
    return getProductDetailsContract.GetProductDetails(id);
  }
  
}


