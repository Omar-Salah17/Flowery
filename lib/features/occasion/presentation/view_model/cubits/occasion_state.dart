part of 'occasion_cubit.dart';

sealed class OccasionState extends Equatable {
  const OccasionState();

  @override
  List<Object> get props => [];
}

final class OccasionInitial extends OccasionState {}

final class OccasionLoading extends OccasionState {}

final class OccasionSuccess extends OccasionState {
  final List<Occasions> occasions;
  const OccasionSuccess(this.occasions);
  @override
  List<Object> get props => [occasions];
}

final class OccasionError extends OccasionState {
  final String error;
  const OccasionError(this.error);
  @override
  List<Object> get props => [error];
}

final class OccasionProductSuccess extends OccasionState {
  final List<Product> products;
  const OccasionProductSuccess(this.products);
  @override
  List<Object> get props => [products];
}
