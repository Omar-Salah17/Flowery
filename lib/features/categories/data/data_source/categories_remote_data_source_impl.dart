import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/features/categories/data/data_source/categories_remote_data_source.dart';
import 'package:flowery/features/categories/data/models/categories_model/categories_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRemoteDataSource)
class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final ApiService apiService;

  CategoriesRemoteDataSourceImpl({required this.apiService});
  @override
  Future<CategoriesModel> getCategories()async {
var response = await   apiService.getCategories();
return response;
  }
}
