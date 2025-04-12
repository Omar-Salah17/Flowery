import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/models/products_model/product.dart';
import '../../../data/models/occaions.dart';
import '../../../domain/use_cases/get_all_occasions_use_case.dart';
import '../../../domain/use_cases/get_product_by_occasion_useCase.dart';
part 'occasion_state.dart';

@injectable
class OccasionCubit extends Cubit<OccasionState> {
  GetAllOccasionsUseCase getAllOccasionsUseCase;
  GetProductByOccasionUsecase getProductByOccasionUsecase;
  OccasionCubit({required this.getAllOccasionsUseCase , required this.getProductByOccasionUsecase})
      : super(OccasionInitial());
      List<Occasions> occasions = [];
      List<Product> products = [];
    late  TabController tabController;
 getAllOccasions() async {
    emit(OccasionLoading());
    final result = await getAllOccasionsUseCase.invoke();
    result.fold(
      (l) => emit(OccasionError(l.errorMessage)),
      (response) {  
        occasions = response;
         emit(OccasionSuccess(response));
      },
    );
 }
  getProductByOccasion({required String occasionId}) async {
      emit(OccasionLoading());
      final result = await getProductByOccasionUsecase.invoke(occasionId: occasionId);
      result.fold(
        (l) => emit(OccasionError(l.errorMessage)),
        (response) {
          products = response;
          emit(OccasionProductSuccess(response));
        },
      );
    }
}
