class DeleteCartResponse {
  final String message;
  final int numOfCartItems;
  final List<DeletedCartItem> cartItems;

  DeleteCartResponse({
    required this.message,
    required this.numOfCartItems,
    required this.cartItems,
  });

  factory DeleteCartResponse.fromJson(Map<String, dynamic> json) {
    return DeleteCartResponse(
      message: json['message'],
      numOfCartItems: json['numOfCartItems'],
      cartItems:
          List.from(
            json['cart']['cartItems'],
          ).map((e) => DeletedCartItem.fromJson(e)).toList(),
    );
  }
}

class DeletedCartItem {
  final String id;
  final DeletedProduct product;
  final int price;
  final int quantity;

  DeletedCartItem({
    required this.id,
    required this.product,
    required this.price,
    required this.quantity,
  });

  factory DeletedCartItem.fromJson(Map<String, dynamic> json) {
    return DeletedCartItem(
      id: json['_id'],
      product: DeletedProduct.fromJson(json['product']),
      price: json['price'],
      quantity: json['quantity'],
    );
  }
}

class DeletedProduct {
  final String id;
  final String title;
  final String imgCover;
  final int price;
  final int priceAfterDiscount;
  final int quantity;

  DeletedProduct({
    required this.id,
    required this.title,
    required this.imgCover,
    required this.price,
    required this.priceAfterDiscount,
    required this.quantity,
  });

  factory DeletedProduct.fromJson(Map<String, dynamic> json) {
    return DeletedProduct(
      id: json['_id'],
      title: json['title'],
      imgCover: json['imgCover'],
      price: json['price'],
      priceAfterDiscount: json['priceAfterDiscount'],
      quantity: json['quantity'],
    );
  }
}
