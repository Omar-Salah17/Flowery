import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/categories/data/models/categories_model/category.dart';
import 'package:flowery/features/categories/domain/use_case/get_all_categories_use_case.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.getAllCategoriesUseCase) : super(CategoriesInitial());
  final GetAllCategoriesUseCase getAllCategoriesUseCase;
  Future<void> getCategoriesData() async {
    emit(CategoriesLoading());
    final result = await Future.wait([getAllCategoriesUseCase.call()]);
    final categoriesResult = result[0];
    if (categoriesResult.isLeft()) {
      emit(CategoriesFailure((categoriesResult as Left).value));
    
    }
    final categories = (categoriesResult as Right).value;
    emit(CategoriesSuccess(categories: categories));
  }
}
