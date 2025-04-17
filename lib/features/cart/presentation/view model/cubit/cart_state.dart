import 'package:equatable/equatable.dart';
import 'package:flowery/features/cart/data/models/cart_model/cart_response.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {
  final bool isSilent; // for background loads

  const CartLoading({this.isSilent = false});

  @override
  List<Object?> get props => [isSilent];
}

final class CartSuccess extends CartState {
  final CartResponse cartResponse;

  const CartSuccess({required this.cartResponse});

  @override
  List<Object?> get props => [cartResponse];
}

final class CartFailure extends CartState {
  final String errorMessage;

  const CartFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
