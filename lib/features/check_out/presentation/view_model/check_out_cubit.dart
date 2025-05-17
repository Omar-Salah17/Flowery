import 'package:flowery/features/check_out/data/models/shipping_address_model.dart';
import 'package:flowery/features/check_out/domain/use_case/cash_check_out_use_case.dart';
import 'package:flowery/features/check_out/domain/use_case/credit_check_out_use_case.dart';
import 'package:flowery/features/check_out/presentation/view_model/check_out_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckOutCubit extends Cubit<CheckOutState> {
  final CreditCheckOutUseCase _creditCheckOutUseCase;
  final CashCheckOutUseCase _cashCheckOutUseCase;

  CheckOutCubit(this._creditCheckOutUseCase, this._cashCheckOutUseCase)
    : super(CheckOutInitial());

  Future<void> creditCheckout(ShippingAddressModel address) async {
    emit(CheckOutLoading());
    final result = await _creditCheckOutUseCase(address);
    result.fold(
      (failure) => emit(CheckOutFailure(failure.errorMessage)),
      (session) => emit(CreditCheckOutSuccess(session)),
    );
  }

  Future<void> cashCheckout(ShippingAddressModel address) async {
    emit(CheckOutLoading());
    final result = await _cashCheckOutUseCase(address);
    result.fold(
      (failure) => emit(CheckOutFailure(failure.errorMessage)),
      (order) => emit(CashCheckOutSuccess(order)),
    );
  }
}
