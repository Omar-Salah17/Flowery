part of 'categories_screen_cubit.dart';

sealed class CategoriesScreenState extends Equatable {
  const CategoriesScreenState();

  @override
  List<Object> get props => [];
}

final class CategoriesInitial extends CategoriesScreenState {}

final class CategoriesLoading extends CategoriesScreenState {}

final class CategoriesSuccess extends CategoriesScreenState {
  final List<Category> categories;

const  CategoriesSuccess({required this.categories});
  
}

final class CategoriesFailure extends CategoriesScreenState {
  final String errorMessage;

 const CategoriesFailure({required this.errorMessage});
  
}

final class ProductsByCategoryInitial extends CategoriesScreenState {}

final class ProductsByCategoryLoading extends CategoriesScreenState {}

final class ProductsByCategorySuccess extends CategoriesScreenState {
 
  final List<Product> products;

 const ProductsByCategorySuccess({required this.products});

  
}

final class ProductsByCategoryFailure extends CategoriesScreenState {
  final String errorMessage;

 const ProductsByCategoryFailure({required this.errorMessage});
  
}
