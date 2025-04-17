import 'package:equatable/equatable.dart';

import 'product.dart';

class CartItem extends Equatable {
  final Product? product;
  final int? price;
  final int? quantity;
  final String? id;

  const CartItem({this.product, this.price, this.quantity, this.id});

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    product:
        json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
    price: json['price'] as int?,
    quantity: json['quantity'] as int?,
    id: json['_id'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'product': product?.toJson(),
    'price': price,
    'quantity': quantity,
    '_id': id,
  };

  @override
  List<Object?> get props => [product, price, quantity, id];
}
