import 'package:flowery/features/home/data/models/CategoriesResponse.dart';

sealed class CategoriesState{}

class CategoriesLoadingState extends CategoriesState{}


class CategoriesInitState extends CategoriesState{}


class CategoriesFailureState extends CategoriesState{
  String message;
  CategoriesFailureState(this.message);
}

class CategoriesSuccessState extends CategoriesState{
  CategoriesResponse categoriesResponse;

  CategoriesSuccessState(this.categoriesResponse);

}