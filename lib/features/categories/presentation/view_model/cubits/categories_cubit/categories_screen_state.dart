part of 'categories_screen_cubit.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesSuccess extends CategoriesState {
  final List<Category> categories;
  final List<Product> products;

  const CategoriesSuccess( {required this.categories, required this.products});
}

final class CategoriesFailure extends CategoriesState {
  final String errorMessage;
  const CategoriesFailure(this.errorMessage);
}
