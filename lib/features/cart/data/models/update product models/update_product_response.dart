class UpdateCartResponse {
  final String message;
  final int numOfCartItems;
  final Cart cart;

  UpdateCartResponse({
    required this.message,
    required this.numOfCartItems,
    required this.cart,
  });

  factory UpdateCartResponse.fromJson(Map<String, dynamic> json) {
    return UpdateCartResponse(
      message: json['message'],
      numOfCartItems: json['numOfCartItems'],
      cart: Cart.fromJson(json['cart']),
    );
  }
}

class Cart {
  final String id;
  final String user;
  final List<CartItem> cartItems;
  final int discount;
  final int totalPrice;
  final int totalPriceAfterDiscount;
  final String createdAt;
  final String updatedAt;
  final int v;

  Cart({
    required this.id,
    required this.user,
    required this.cartItems,
    required this.discount,
    required this.totalPrice,
    required this.totalPriceAfterDiscount,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['_id'],
      user: json['user'],
      cartItems: List<CartItem>.from(
        json['cartItems'].map((x) => CartItem.fromJson(x)),
      ),
      discount: json['discount'],
      totalPrice: json['totalPrice'],
      totalPriceAfterDiscount: json['totalPriceAfterDiscount'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}

class CartItem {
  final UpdatedProduct product;
  final int price;
  final int quantity;
  final String id;

  CartItem({
    required this.product,
    required this.price,
    required this.quantity,
    required this.id,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: UpdatedProduct.fromJson(json['product']),
      price: json['price'],
      quantity: json['quantity'],
      id: json['_id'],
    );
  }
}

class UpdatedProduct {
  final String id;
  final String title;
  final String slug;
  final String description;
  final String imgCover;
  final List<String> images;
  final int price;
  final int priceAfterDiscount;
  final int quantity;
  final String category;
  final String occasion;
  final String createdAt;
  final String updatedAt;
  final int v;
  final int discount;
  final int sold;
  final double rateAvg;
  final int rateCount;

  UpdatedProduct({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.imgCover,
    required this.images,
    required this.price,
    required this.priceAfterDiscount,
    required this.quantity,
    required this.category,
    required this.occasion,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.discount,
    required this.sold,
    required this.rateAvg,
    required this.rateCount,
  });

  factory UpdatedProduct.fromJson(Map<String, dynamic> json) {
    return UpdatedProduct(
      id: json['_id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      imgCover: json['imgCover'],
      images: List<String>.from(json['images']),
      price: json['price'],
      priceAfterDiscount: json['priceAfterDiscount'],
      quantity: json['quantity'],
      category: json['category'],
      occasion: json['occasion'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
      discount: json['discount'],
      sold: json['sold'],
      rateAvg: (json['rateAvg'] as num).toDouble(),
      rateCount: json['rateCount'],
    );
  }
}
