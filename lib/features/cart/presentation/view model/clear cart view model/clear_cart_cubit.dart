import 'dart:developer';
import 'package:bloc/bloc.dart';

import 'package:flowery/features/cart/domain/usecases/clear_cart_usecase.dart';
import 'package:flowery/features/cart/presentation/view%20model/clear%20cart%20view%20model/clear_cart_states.dart';

class ClearCartCubit extends Cubit<ClearCartState> {
  final ClearCartUsecase clearCartUsecase;

  ClearCartCubit(this.clearCartUsecase) : super(ClearCartInitial());

  Future<void> clearCart() async {
    emit(ClearCartLoading());
    log("ClearCartCubit: before invoke");

    final result = await clearCartUsecase.invoke();

    result.fold(
      (failure) {
        log("ClearCartCubit: failure - ${failure.errorMessage}");
        emit(ClearCartFailure(errorMessage: failure.errorMessage));
      },
      (response) {
        log("ClearCartCubit: success");
        emit(ClearCartSuccess(response: response));
      },
    );
  }
}
