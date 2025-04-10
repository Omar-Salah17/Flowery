import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/core/apiManger/api_manager.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/constants.dart';
import 'package:flowery/features/productsDetails/data/model/product_details_model.dart';
import 'package:flowery/features/productsDetails/data/remote/remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RemoteDataSource)
class RemoteDataSourceImpl implements RemoteDataSource {

  final apiServices = getIt<ApiService>();
  @override
  Future<List<Product>> GetProductDetails(String producrId) async {
    var response = await apiServices.getProductDetails(producrId);
    return response.products ?? [];
  }
}
