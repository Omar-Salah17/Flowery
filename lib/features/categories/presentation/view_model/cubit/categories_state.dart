part of 'categories_cubit.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesSuccess extends CategoriesState {
  final List<Category> categories;

const  CategoriesSuccess({required this.categories});
}

final class CategoriesFailure extends CategoriesState {
  final String errorMessage;
  const CategoriesFailure(this.errorMessage);
}
