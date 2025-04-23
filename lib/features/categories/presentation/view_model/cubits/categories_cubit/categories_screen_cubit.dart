import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';
import 'package:flowery/features/categories/data/models/categories_model/category.dart';
import 'package:flowery/features/categories/domain/use_case/get_all_categories_use_case.dart';
import 'package:flowery/features/categories/domain/use_case/get_products_by_category_use_case.dart';
import 'package:flowery/features/categories/domain/use_case/search_use_case.dart';

part 'categories_screen_state.dart';

class CategoriesScreenCubit extends Cubit<CategoriesScreenState> {
  CategoriesScreenCubit(
    this.getAllCategoriesUseCase,
    this.getProductsByCategoryUseCase,
    this.searchUseCase,
  ) : super(ProductsByCategoryInitial());
  final GetAllCategoriesUseCase getAllCategoriesUseCase;
  final GetProductsByCategoryUseCase getProductsByCategoryUseCase;
  final SearchUseCase searchUseCase;
  String selectedCategoryId = "all";
  List<Category> categories = [];

  Future<void> getAllCategories() async {
    emit(CategoriesLoading());
    final result = await getAllCategoriesUseCase.call();
    result.fold(
      (falilure) {
        emit(CategoriesFailure(errorMessage: falilure.errorMessage));
      },
      (category) {
        categories = category;
        emit(CategoriesSuccess(categories: categories));
      },
    );
  }

  Future<void> getProductsByCategory({String? categoryId}) async {
    selectedCategoryId = categoryId ?? "all";
    emit(CategoriesLoading());
    final result = await getProductsByCategoryUseCase.call(
      categoryId: categoryId,
    );
    result.fold(
      (falilure) {
        emit(ProductsByCategoryFailure(errorMessage: falilure.errorMessage));
      },
      (products) {
        emit(ProductsByCategorySuccess(products: products));
      },
    );
  }

  Future<void> search({String? categoryId, String? keyword}) async {
    selectedCategoryId = categoryId ?? "all";
    emit(CategoriesLoading());
    final result = await searchUseCase.call(
      categoryId: categoryId,
      keyword: keyword,
    );
    result.fold(
      (failure) {
        emit(ProductsByCategoryFailure(errorMessage: failure.errorMessage));
      },
      (products) {
        emit(ProductsByCategorySuccess(products: products));
      },
    );
  }
}
