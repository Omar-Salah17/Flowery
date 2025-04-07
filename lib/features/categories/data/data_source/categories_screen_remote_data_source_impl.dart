import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/features/categories/data/data_source/categories_screen_remote_data_source.dart';
import 'package:flowery/features/categories/data/models/categories_model/categories_model.dart';
import 'package:flowery/features/categories/data/models/products_model/products_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesScreenRemoteDataSource)
class CategoriesScreenRemoteDataSourceImpl
    implements CategoriesScreenRemoteDataSource {
  final ApiService apiService;

  CategoriesScreenRemoteDataSourceImpl({required this.apiService});
  @override
  Future<CategoriesModel> getCategories() async {
    var response = await apiService.getCategories();
    return response;
  }

  @override
  Future<ProductsModel> getProductsByCategory({String? categoryId}) async {
    var response = await apiService.getProductsByCategory(
      categoryId: categoryId,
    );
    return response;
  }
}
