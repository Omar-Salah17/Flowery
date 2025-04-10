import 'package:flowery/features/categories/data/models/categories_model/categories_model.dart';

sealed class CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesInitState extends CategoriesState {}

class CategoriesFailureState extends CategoriesState {
  String message;
  CategoriesFailureState(this.message);
}

class CategoriesSuccessState extends CategoriesState {
  CategoriesModel categoriesResponse;

  CategoriesSuccessState(this.categoriesResponse);
}
