import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/models/products_model/products_model.dart';
import 'package:flowery/features/occasion/domain/repos/occasion_remote_data_source_contract.dart';
import 'package:injectable/injectable.dart';

import '../models/occaions.dart';
 @Injectable(as: OccasionRemoteDataSourceContract)
class OccasionRemoteDataSourceImpl implements OccasionRemoteDataSourceContract {

   final apiServices = getIt<ApiService>();
  @override
  Future<List<Occasions>> getAllOccasions() async {

  var response = await apiServices.getAllOccasions();
    return response.occasions??[];}


  @override
  Future<ProductsModel> getProductsByOccasion({String? occasionId}) async {
    var response = await apiServices.getAllProductByOccasion(occasionId:occasionId??'');
    return response;
  }
}