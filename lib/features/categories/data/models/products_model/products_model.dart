import 'package:equatable/equatable.dart';
import 'metadata.dart';
import 'product.dart';

class ProductsModel extends Equatable {
  final String? message;
  final Metadata? metadata;
  final List<Product>? products;

  const ProductsModel({this.message, this.metadata, this.products});

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    message: json['message'] as String?,
    metadata:
        json['metadata'] == null
            ? null
            : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
    products:
        (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'message': message,
    'metadata': metadata?.toJson(),
    'products': products?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [message, metadata, products];
}
