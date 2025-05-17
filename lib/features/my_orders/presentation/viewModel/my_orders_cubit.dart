import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flowery/features/my_orders/domain/useCases/get_my_orders_use_case.dart';
import 'package:flowery/features/my_orders/presentation/viewModel/my_orders_states.dart';
import 'package:injectable/injectable.dart';


@injectable
class MyOrdersCubit extends Cubit<MyOrdersState> {
  MyOrdersCubit(this.getMyOrdersUseCase) : super(MyOrdersInitial());
  final GetMyOrdersUseCase getMyOrdersUseCase;

  Future<void> featchMyOrders() async {
    final result = await getMyOrdersUseCase.getMyOrders();
    result.fold(
      (failure) {
        emit(MyOrdersError(message: failure.errorMessage));
      },
      (responce) {
        log("data in MyOrdersCubit $responce");
        emit(MyOrdersSuccess(orders: responce));
      },
    );
  }
}
