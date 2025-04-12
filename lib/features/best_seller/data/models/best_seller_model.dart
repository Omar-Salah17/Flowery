import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';

part 'best_seller_model.g.dart'; // هذا مهم لتوليد الكود

@JsonSerializable()
class BestSellerModel extends Equatable {
  final String? message;

  final List<Product>? bestSeller;

  const BestSellerModel({this.message, this.bestSeller});

  // Equatable props
  @override
  List<Object?> get props => [message, bestSeller];

  // JSON Serialization
  factory BestSellerModel.fromJson(Map<String, dynamic> json) =>
      _$BestSellerModelFromJson(json);

  Map<String, dynamic> toJson() => _$BestSellerModelToJson(this);
}
