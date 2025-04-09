part of 'best_seller_cubit.dart';

abstract class BestSellerState extends Equatable {
  const BestSellerState();

  @override
  List<Object?> get props => [];
}

class BestSellerInitial extends BestSellerState {}

class BestSellerLoading extends BestSellerState {}

class BestSellerSuccess extends BestSellerState {
  final BestSellerModel model;

  const BestSellerSuccess({required this.model});

  @override
  List<Object?> get props => [model];
}

class BestSellerFailure extends BestSellerState {
  final String errorMessage;

  const BestSellerFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
