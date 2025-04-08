import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/home/data/models/occaions.dart';
import 'package:flowery/features/home/domain/repository/occasion_remote_data_source_contract.dart';
import 'package:injectable/injectable.dart';
 @Injectable(as: OccasionRemoteDataSourceContract)
class OccasionRemoteDataSourceImpl implements OccasionRemoteDataSourceContract {
  @override
  Future<List<Occasions>> getAllOccasions() async {
    final apiServices = getIt<ApiService>();
  var response = await apiServices.getAllOccasions();
    return response.occasions??[];
  }
}