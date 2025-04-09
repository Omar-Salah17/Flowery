import 'package:flowery/features/productsDetails/data/model/product_details_model.dart';
import 'package:flowery/features/productsDetails/data/remote/remote_data_source.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSource remoteDataSource;
  RemoteDataSourceImpl(this.remoteDataSource);

  @override
  Future<List<ProductModel>> GetProductDetails(String id) {
   return remoteDataSource.GetProductDetails(id);
  }
  
}



