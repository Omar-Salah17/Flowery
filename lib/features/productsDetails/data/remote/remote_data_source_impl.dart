import 'package:flowery/core/apiManger/api_manager.dart';
import 'package:flowery/core/utils/constants.dart';
import 'package:flowery/features/productsDetails/data/model/product_details_model.dart';
import 'package:flowery/features/productsDetails/data/remote/remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RemoteDataSource)
class RemoteDataSourceImpl implements RemoteDataSource {
  ApiManager apiManager;
  RemoteDataSourceImpl(this.apiManager);

  @override
  Future<List<ProductsModel>> GetProductDetails(String producrId) async {
    var responce = await apiManager.postData(
      endPoint: Constants.productDetails,
      data: {"id": producrId},
    );

    return responce.data;
  }
}
