import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowery/features/home/data/models/occaions.dart';
import 'package:flowery/features/home/data/models/product_response_model.dart';
import 'package:flowery/features/home/domain/use_cases/get_all_occasions_use_case.dart';
import 'package:flowery/features/home/domain/use_cases/get_product_by_occasion_useCase.dart';
import 'package:flutter/material.dart';
part 'occasion_state.dart';

class OccasionCubit extends Cubit<OccasionState> {
  GetAllOccasionsUseCase getAllOccasionsUseCase;
  GetProductByOccasionUsecase getProductByOccasionUsecase;
  OccasionCubit({required this.getAllOccasionsUseCase , required this.getProductByOccasionUsecase})
      : super(OccasionInitial());
      List<Occasions> occasions = [];
      List<Products> products = [];
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
