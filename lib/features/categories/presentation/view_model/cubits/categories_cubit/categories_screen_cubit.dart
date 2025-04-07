import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flowery/features/categories/data/models/categories_model/category.dart';
import 'package:flowery/features/categories/data/models/products_model/product.dart';
import 'package:flowery/features/categories/domain/use_case/get_all_categories_use_case.dart';
import 'package:flowery/features/categories/domain/use_case/get_products_by_category_use_case.dart';

part 'categories_screen_state.dart';

class CategoriesScreenCubit extends Cubit<CategoriesState> {
  CategoriesScreenCubit(
    this.getAllCategoriesUseCase,
    this.getProductsByCategoryUseCase,
  ) : super(CategoriesInitial());
  final GetAllCategoriesUseCase getAllCategoriesUseCase;
  final GetProductsByCategoryUseCase getProductsByCategoryUseCase;
  String selectedCategoryId = "all";
  Future<void> getCategoriesScreenData({String? categoryId}) async {
    selectedCategoryId = categoryId ?? "all";
    emit(CategoriesLoading());
    final result = await Future.wait([
      getAllCategoriesUseCase.call(),
      getProductsByCategoryUseCase.call(categoryId: categoryId),
    ]);

    final categoriesResult = result[0];
    final productsResult = result[1];
    if (categoriesResult.isLeft()) {
      emit(CategoriesFailure((categoriesResult as Left).value));
    }
    if (productsResult.isLeft()) {
      emit(CategoriesFailure((productsResult as Left).value));
    }
    
    final categories = (categoriesResult as Right).value;
    final products = (productsResult as Right).value;
    emit(CategoriesSuccess(categories: categories, products: products));
  }
  // Future<void> getAllCategories() async {
  //   emit(CategoriesLoading());
  //   final result = await getAllCategoriesUseCase.call();
  //   result.fold(
  //     (falilure) {
  //       emit(CategoriesFailure(falilure.errorMessage));
  //     },
  //     (category) {
  //       emit(CategoriesSuccess(categories: category, products: []));
  //     },
  //   );
  // }

  // Future<void> getProductsByCategory({String? categoryId}) async {
  //   emit(CategoriesLoading());
  //   final result = await getProductsByCategoryUseCase.call(
  //     categoryId: categoryId,
  //   );
  //   result.fold(
  //     (falilure) {
  //       emit(CategoriesFailure(falilure.errorMessage));
  //     },
  //     (category) {
  //       emit(CategoriesSuccess(categories: [], products: []));
  //     },
  //   );
  // }
}
