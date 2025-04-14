import 'package:equatable/equatable.dart';
import 'package:flowery/features/cart/data/models/clear%20cart%20models/clear_cart_response.dart';

sealed class ClearCartState extends Equatable {
  const ClearCartState();

  @override
  List<Object?> get props => [];
}

final class ClearCartInitial extends ClearCartState {}

final class ClearCartLoading extends ClearCartState {}

final class ClearCartSuccess extends ClearCartState {
  final ClearCartResponse response;

  const ClearCartSuccess({required this.response});

  @override
  List<Object?> get props => [response];
}

final class ClearCartFailure extends ClearCartState {
  final String errorMessage;

  const ClearCartFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
