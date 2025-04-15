import 'package:equatable/equatable.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';

class ProductDetailsModel extends Equatable {
  final String? message;
  final Product? product;

  const ProductDetailsModel({this.message, this.product});

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      message: json["message"] as String?,
      product:
          json["product"] == null
              ? null
              : Product.fromJson(json["product"] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'product': product?.toJson(),
  };

  @override
  List<Object?> get props => [message, product];
}
