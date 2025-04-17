part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {
  final CartResponse cartResponse;

  const CartSuccess({required this.cartResponse});
}

final class CartFailure extends CartState {
  final String errorMessage;

const  CartFailure({required this.errorMessage});
}
