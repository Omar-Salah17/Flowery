import 'package:equatable/equatable.dart';

import 'package:flowery/features/cart/data/models/cart_model/cart_item.dart';

class CartModel extends Equatable {
  final String? id;
  final String? user;
  final List<CartItem>? cartItems;
  final int? discount;
  final int? totalPrice;
  final int? totalPriceAfterDiscount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const CartModel({
    this.id,
    this.user,
    this.cartItems,
    this.discount,
    this.totalPrice,
    this.totalPriceAfterDiscount,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    id: json['_id'] as String?,
    user: json['user'] as String?,
    cartItems: (json['cartItems'] as List<dynamic>?)
        ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    discount: (json['discount'] as num?)?.toInt(),
    totalPrice: (json['totalPrice'] as num?)?.toInt(),
    totalPriceAfterDiscount: (json['totalPriceAfterDiscount'] as num?)?.toInt(),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    v: json['__v'] as int?,
  );


  Map<String, dynamic> toJson() => {
    '_id': id,
    'user': user,
    'cartItems': cartItems?.map((e) => e.toJson()).toList(),
    'discount': discount,
    'totalPrice': totalPrice,
    'totalPriceAfterDiscount': totalPriceAfterDiscount,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    '__v': v,
  };

  @override
  List<Object?> get props {
    return [
      id,
      user,
      cartItems,
      discount,
      totalPrice,
      totalPriceAfterDiscount,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
