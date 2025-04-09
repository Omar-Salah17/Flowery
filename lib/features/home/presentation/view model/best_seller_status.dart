import 'package:equatable/equatable.dart';
import 'package:flowery/features/home/data/models/best-seller_response.dart';

sealed class BestSellerState extends Equatable {
  const BestSellerState();

  @override
  List<Object> get props => [];
}

final class BestSellerInitial extends BestSellerState {}

final class BestSellerLoading extends BestSellerState {}

final class BestSellerSuccess extends BestSellerState {
  final List<BestSeller> bestSellers;

  const BestSellerSuccess({required this.bestSellers});

  @override
  List<Object> get props => [bestSellers];
}

final class BestSellerFailure extends BestSellerState {
  final String errorMessage;

  const BestSellerFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
