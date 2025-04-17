import 'package:equatable/equatable.dart';

import 'cart_model.dart';

class CartResponse extends Equatable {
  final String? message;
  final int? numOfCartItems;
  final CartModel? cart;

  const CartResponse({this.message, this.numOfCartItems, this.cart});

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
    message: json['message'] as String?,
    numOfCartItems: json['numOfCartItems'] as int?,
    cart:
        json['cart'] == null
            ? null
            : CartModel.fromJson(json['cart'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'message': message,
    'numOfCartItems': numOfCartItems,
    'cart': cart?.toJson(),
  };

  @override
  List<Object?> get props => [message, numOfCartItems, cart];
}
