import 'package:equatable/equatable.dart';
import 'package:flowery/features/cart/data/models/update%20product%20models/update_product_response.dart';

abstract class UpdateCartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateCartInitial extends UpdateCartState {}

class UpdateCartLoading extends UpdateCartState {}

class UpdateCartSuccess extends UpdateCartState {
  final UpdateCartResponse response;

  UpdateCartSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class UpdateCartFailure extends UpdateCartState {
  final String error;

  UpdateCartFailure(this.error);

  @override
  List<Object?> get props => [error];
}
