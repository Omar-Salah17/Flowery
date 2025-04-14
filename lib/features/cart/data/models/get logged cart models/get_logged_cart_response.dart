class GetLoggedCartResponse {
  final String message;
  final int numOfCartItems;
  final Cart cart;

  GetLoggedCartResponse({
    required this.message,
    required this.numOfCartItems,
    required this.cart,
  });

  factory GetLoggedCartResponse.fromJson(Map<String, dynamic> json) {
    return GetLoggedCartResponse(
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
  final double totalPrice;
  final double totalPriceAfterDiscount;
  final DateTime createdAt;
  final DateTime updatedAt;

  Cart({
    required this.id,
    required this.user,
    required this.cartItems,
    required this.discount,
    required this.totalPrice,
    required this.totalPriceAfterDiscount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['_id'],
      user: json['user'],
      cartItems:
          (json['cartItems'] as List)
              .map((item) => CartItem.fromJson(item))
              .toList(),
      discount: json['discount'],
      totalPrice: (json['totalPrice'] as num).toDouble(),
      totalPriceAfterDiscount:
          (json['totalPriceAfterDiscount'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class CartItem {
  final LoggedProduct product;
  final double price;
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
      product: LoggedProduct.fromJson(json['product']),
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'],
      id: json['_id'],
    );
  }
}

class LoggedProduct {
  final String id;
  final String title;
  final String slug;
  final String description;
  final String imgCover;
  final List<String> images;
  final double price;
  final double priceAfterDiscount;
  final int quantity;
  final String category;
  final String occasion;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int discount;
  final int sold;
  final double rateAvg;
  final int rateCount;

  LoggedProduct({
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
    required this.discount,
    required this.sold,
    required this.rateAvg,
    required this.rateCount,
  });

  factory LoggedProduct.fromJson(Map<String, dynamic> json) {
    return LoggedProduct(
      id: json['_id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      imgCover: json['imgCover'],
      images: List<String>.from(json['images']),
      price: (json['price'] as num).toDouble(),
      priceAfterDiscount: (json['priceAfterDiscount'] as num).toDouble(),
      quantity: json['quantity'],
      category: json['category'],
      occasion: json['occasion'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      discount: json['discount'],
      sold: json['sold'],
      rateAvg: (json['rateAvg'] as num).toDouble(),
      rateCount: json['rateCount'],
    );
  }
}
