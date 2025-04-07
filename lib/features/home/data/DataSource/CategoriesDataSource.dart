import '../models/CategoriesResponse.dart';

abstract class CategoriesDataSource{
  Future<CategoriesResponse> getCategories();
}