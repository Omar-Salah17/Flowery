import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowery/features/home/data/models/occaions.dart';
import 'package:flowery/features/home/domain/use_cases/get_all_occasions_use_case.dart';
import 'package:flutter/material.dart';

part 'occasion_state.dart';

class OccasionCubit extends Cubit<OccasionState> {
  GetAllOccasionsUseCase getAllOccasionsUseCase;
  OccasionCubit({required this.getAllOccasionsUseCase})
      : super(OccasionInitial());
      List<Occasions> occasions = [];
    late  TabController tabController;
 getAllOccasions() async {
    emit(OccasionLoading());
    final result = await getAllOccasionsUseCase.invoke();
    result.fold(
      (l) => emit(OccasionError(l.errorMessage)),
      (response) {
        //  tabController = TabController(length: response.length, vsync: TickerProviderStateMixin());
         // tabController = TabController(length: response.length, vsync: this);  
        occasions = response;
        print(occasions.length);
         emit(OccasionSuccess(response));
      print(response);
      },
    );
 }
}
