import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';
import 'package:flowery/features/productsDetails/data/remote/remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RemoteDataSource)
class RemoteDataSourceImpl implements RemoteDataSource {
  final apiServices = getIt<ApiService>();
  @override
  Future<Product> getProductDetails(String producrId) async {
    var response = await apiServices.getProductDetails(producrId);
    return response;
  }
}
