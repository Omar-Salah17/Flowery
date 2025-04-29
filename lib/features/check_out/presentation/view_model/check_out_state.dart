import 'package:equatable/equatable.dart';
import 'package:flowery/features/check_out/data/models/cash_order_response.dart';
import 'package:flowery/features/check_out/data/models/check_out_session_response.dart';

abstract class CheckOutState extends Equatable {
  const CheckOutState();

  @override
  List<Object?> get props => [];
}

class CheckOutInitial extends CheckOutState {}

class CheckOutLoading extends CheckOutState {}

class CreditCheckOutSuccess extends CheckOutState {
  final CheckoutSessionResponse session;

  const CreditCheckOutSuccess(this.session);

  @override
  List<Object?> get props => [session];
}

class CashCheckOutSuccess extends CheckOutState {
  final CashOrderResponse order;

  const CashCheckOutSuccess(this.order);

  @override
  List<Object?> get props => [order];
}

class CheckOutFailure extends CheckOutState {
  final String error;

  const CheckOutFailure(this.error);

  @override
  List<Object?> get props => [error];
}
