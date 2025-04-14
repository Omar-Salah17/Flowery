import 'package:equatable/equatable.dart';
import 'package:flowery/features/cart/data/models/delete%20item%20models/delete_specific_item_response.dart';

sealed class DeleteCartItemState extends Equatable {
  const DeleteCartItemState();

  @override
  List<Object> get props => [];
}

final class DeleteCartItemInitial extends DeleteCartItemState {}

final class DeleteCartItemLoading extends DeleteCartItemState {}

final class DeleteCartItemSuccess extends DeleteCartItemState {
  final DeleteCartResponse response;

  const DeleteCartItemSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

final class DeleteCartItemFailure extends DeleteCartItemState {
  final String errorMessage;

  const DeleteCartItemFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
