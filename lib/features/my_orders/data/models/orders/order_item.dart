import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'product.dart';

part 'order_item.g.dart';

@JsonSerializable()
class OrderItem {
  final Product? product;
  final int? price;
  final int? quantity;
  @JsonKey(name: '_id')
  final String? id;

  const OrderItem({this.product, this.price, this.quantity, this.id});

  @override
  String toString() {
    return 'OrderItem(product: $product, price: $price, quantity: $quantity, id: $id)';
  }

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return _$OrderItemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);

  OrderItem copyWith({
    Product? product,
    int? price,
    int? quantity,
    String? id,
  }) {
    return OrderItem(
      product: product ?? this.product,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      id: id ?? this.id,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! OrderItem) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      product.hashCode ^ price.hashCode ^ quantity.hashCode ^ id.hashCode;
}
