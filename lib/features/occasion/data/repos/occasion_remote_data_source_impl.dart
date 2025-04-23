import 'package:flowery/core/api_manger/api_service.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/models/products_model/products_model.dart';
import 'package:flowery/features/occasion/data/models/occaions.dart';
import 'package:flowery/features/occasion/domain/repos/occasion_remote_data_source_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OccasionRemoteDataSourceContract)
class OccasionRemoteDataSourceImpl implements OccasionRemoteDataSourceContract {
  final apiServices = getIt<ApiService>();
  @override
  Future<List<Occasions>> getAllOccasions() async {
    final response = await apiServices.getAllOccasions();
    return response.occasions ?? [];
  }

  @override
  Future<ProductsModel> getProductsByOccasion({String? occasionId}) async {
    final response = await apiServices.getAllProductByOccasion(
      occasionId: occasionId,
    );
    return response;
  }
}
