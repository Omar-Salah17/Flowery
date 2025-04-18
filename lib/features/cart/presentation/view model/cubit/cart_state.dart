import 'package:equatable/equatable.dart';
import 'package:flowery/features/cart/data/models/cart_model/cart_response.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {
  final String? productId;
  const CartLoading({ this.productId});

}

final class CartSuccess extends CartState {
  final String? productId;
  final CartResponse cartResponse;

  const CartSuccess({required this.cartResponse,  this.productId});

  @override
  List<Object?> get props => [cartResponse];
}

final class CartFailure extends CartState {
  final String? productId;
  final String errorMessage;

  const CartFailure({required this.errorMessage,  this.productId});

  @override
  List<Object?> get props => [errorMessage];
}
