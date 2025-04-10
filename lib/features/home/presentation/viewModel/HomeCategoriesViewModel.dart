
import 'package:bloc/bloc.dart';
import 'package:flowery/features/home/domain/use_case/GetCategoriesUseCase.dart';
import 'package:injectable/injectable.dart';

import 'HomeCategoriesStates.dart';

@injectable
class HomeCategoriesViewModel extends Cubit<CategoriesState>{

  GetCategoriesUseCase getCategoriesUseCase;
  HomeCategoriesViewModel(this.getCategoriesUseCase) : super(CategoriesInitState());

  Future<void> getCategories()async{
    var result = await getCategoriesUseCase.call();

    result.fold(
          (failure) {
            emit(CategoriesFailureState(failure.errorMessage));

    },
          (categories) {
            emit(CategoriesSuccessState(categories));

    },
    );


  }

}