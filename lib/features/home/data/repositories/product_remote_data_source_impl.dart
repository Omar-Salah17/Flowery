import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/home/data/models/product_response_model.dart';
import 'package:flowery/features/home/domain/repository/product_remote_data_source.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource{
  @override
  Future<List<Products>> getAllProductByOccasion({required String occasionId}) async {
    final apiServices = getIt<ApiService>();
    var response = await apiServices.getAllProductByOccasion(occasionId: occasionId);
    return response.products??[];
  }
}