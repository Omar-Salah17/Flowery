import 'package:equatable/equatable.dart';
import 'package:flowery/features/cart/data/models/add_product_response.dart';

sealed class AddToCartState extends Equatable {
  const AddToCartState();

  @override
  List<Object> get props => [];
}

final class AddToCartInitial extends AddToCartState {}

final class AddToCartLoading extends AddToCartState {}

final class AddToCartSuccess extends AddToCartState {
  final AddProductResponse response;

  const AddToCartSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

final class AddToCartFailure extends AddToCartState {
  final String errorMessage;

  const AddToCartFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
