import 'package:flowery/features/categories/data/models/categories_model/categories_model.dart';
import 'package:flowery/core/utils/models/products_model/products_model.dart';

abstract class CategoriesScreenRemoteDataSource {
  Future<CategoriesModel> getCategories();
  Future<ProductsModel> getProductsByCategory({String? categoryId});
}
