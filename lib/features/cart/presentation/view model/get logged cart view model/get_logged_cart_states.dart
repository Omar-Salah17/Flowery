import 'package:equatable/equatable.dart';
import 'package:flowery/features/cart/data/models/get%20logged%20cart%20models/get_logged_cart_response.dart';

sealed class GetLoggedCartState extends Equatable {
  const GetLoggedCartState();

  @override
  List<Object> get props => [];
}

final class GetLoggedCartInitial extends GetLoggedCartState {}

final class GetLoggedCartLoading extends GetLoggedCartState {}

final class GetLoggedCartSuccess extends GetLoggedCartState {
  final GetLoggedCartResponse response;

  const GetLoggedCartSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

final class GetLoggedCartFailure extends GetLoggedCartState {
  final String errorMessage;

  const GetLoggedCartFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
