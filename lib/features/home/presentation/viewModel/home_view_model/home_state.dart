import 'package:equatable/equatable.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';
import 'package:flowery/features/occasion/data/models/occaions.dart';

import '../../../../../core/enums/request_enum.dart';
import '../../../../categories/data/models/categories_model/category.dart';


class HomeState extends Equatable {
  final RequestState categoriesState;
  final RequestState bestSellerState;
  final RequestState occasionState;

  final List<Category>? categories;
  final List<Product>? bestSellers;
  final List<Occasions>? occasions;

  final String? error;

  const HomeState({
    this.categoriesState = RequestState.initial,
    this.bestSellerState = RequestState.initial,
    this.occasionState = RequestState.initial,
    this.categories,
    this.bestSellers,
    this.occasions,
    this.error,
  });

  HomeState copyWith({
    RequestState? locationState,
    RequestState? categoriesState,
    RequestState? bestSellerState,
    RequestState? occasionState,
    String? location,
    List<Category>? categories,
    List<Product>? bestSellers,
    List<Occasions>? occasions,
    String? error,
  }) {
    return HomeState(
      categoriesState: categoriesState ?? this.categoriesState,
      bestSellerState: bestSellerState ?? this.bestSellerState,
      occasionState: occasionState ?? this.occasionState,
      categories: categories ?? this.categories,
      bestSellers: bestSellers ?? this.bestSellers,
      occasions: occasions ?? this.occasions,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
    categoriesState,
    bestSellerState,
    occasionState,
    categories,
    bestSellers,
    occasions,
    error,
  ];


}
