import 'package:flowery/features/categories/data/models/categories_model/categories_model.dart';
import 'package:flowery/features/home/data/DataSource/CategoriesDataSource.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apiManger/apiService.dart';
import '../../../../core/di/di.dart';

@Injectable(as: CategoriesDataSource)
class CategoriesDataSourceImpl implements CategoriesDataSource {
  final apiServices = getIt<ApiService>();
  @override
  Future<CategoriesModel> getCategories() async {
    var response = await apiServices.getCategories();
    return response;
  }
}
