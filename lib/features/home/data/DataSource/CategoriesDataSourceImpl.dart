
import 'package:flowery/features/home/data/DataSource/CategoriesDataSource.dart';
import 'package:flowery/features/home/data/models/CategoriesResponse.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apiManger/apiService.dart';
import '../../../../core/di/di.dart';

@Injectable(as: CategoriesDataSource)
class CategoriesDataSourceImpl implements CategoriesDataSource{
    final apiServices = getIt<ApiService>();
  @override
  Future<CategoriesResponse> getCategories() async{
    var response = await apiServices.getCategories();
    return response;
  }
}