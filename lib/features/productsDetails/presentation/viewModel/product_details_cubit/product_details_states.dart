import 'package:flowery/features/productsDetails/data/model/product_details_model.dart';

abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsSuccess extends ProductDetailsState {
  final List<Product> product;

  ProductDetailsSuccess({required this.product});
}

class ProductDetailsError extends ProductDetailsState {
  final String message;

  ProductDetailsError({required this.message});
}
