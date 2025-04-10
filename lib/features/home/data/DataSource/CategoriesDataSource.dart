import 'package:flowery/features/categories/data/models/categories_model/categories_model.dart';


abstract class CategoriesDataSource {
  Future<CategoriesModel> getCategories();
}
