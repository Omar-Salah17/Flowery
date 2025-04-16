import 'dart:developer';
import 'package:flowery/features/cart/presentation/view%20model/get%20logged%20cart%20view%20model/get_logged_cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flowery/features/cart/domain/usecases/get_logged_cart_usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLoggedCartCubit extends Cubit<GetLoggedCartState> {
  GetLoggedCartCubit(this.usecase) : super(GetLoggedCartInitial());

  final GetLoggedCartUsecase usecase;

  Future<void> getLoggedCart() async {
    emit(GetLoggedCartLoading());
    log("GetLoggedCartCubit: Loading...");

    final result = await usecase.invoke();

    result.fold(
      (failure) {
        log("GetLoggedCartCubit: Failure - ${failure.errorMessage}");
        emit(GetLoggedCartFailure(errorMessage: failure.errorMessage));
      },
      (response) {
        log("GetLoggedCartCubit: Success");
        emit(GetLoggedCartSuccess(response: response));
      },
    );
  }
}
