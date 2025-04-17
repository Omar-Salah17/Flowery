
class DeleteCartResponse {
  String? message;
  int? numOfCartItems;
  Cart? cart;

  DeleteCartResponse({this.message, this.numOfCartItems, this.cart});

  DeleteCartResponse.fromJson(Map<String, dynamic> json) {
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["numOfCartItems"] is int) {
      numOfCartItems = json["numOfCartItems"];
    }
    if(json["cart"] is Map) {
      cart = json["cart"] == null ? null : Cart.fromJson(json["cart"]);
    }
  }

  static List<DeleteCartResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(DeleteCartResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    _data["numOfCartItems"] = numOfCartItems;
    if(cart != null) {
      _data["cart"] = cart?.toJson();
    }
    return _data;
  }
}

class Cart {
  String? id;
  String? user;
  List<CartItems>? cartItems;
  int? discount;
  int? totalPrice;
  int? totalPriceAfterDiscount;
  String? createdAt;
  String? updatedAt;
  int? v;

  Cart({this.id, this.user, this.cartItems, this.discount, this.totalPrice, this.totalPriceAfterDiscount, this.createdAt, this.updatedAt, this.v});

  Cart.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["user"] is String) {
      user = json["user"];
    }
    if(json["cartItems"] is List) {
      cartItems = json["cartItems"] == null ? null : (json["cartItems"] as List).map((e) => CartItems.fromJson(e)).toList();
    }
    if(json["discount"] is int) {
      discount = json["discount"];
    }
    if(json["totalPrice"] is int) {
      totalPrice = json["totalPrice"];
    }
    if(json["totalPriceAfterDiscount"] is int) {
      totalPriceAfterDiscount = json["totalPriceAfterDiscount"];
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["__v"] is int) {
      v = json["__v"];
    }
  }

  static List<Cart> fromList(List<Map<String, dynamic>> list) {
    return list.map(Cart.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["user"] = user;
    if(cartItems != null) {
      _data["cartItems"] = cartItems?.map((e) => e.toJson()).toList();
    }
    _data["discount"] = discount;
    _data["totalPrice"] = totalPrice;
    _data["totalPriceAfterDiscount"] = totalPriceAfterDiscount;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}

class CartItems {
  Product? product;
  int? price;
  int? quantity;
  String? id;

  CartItems({this.product, this.price, this.quantity, this.id});

  CartItems.fromJson(Map<String, dynamic> json) {
    if(json["product"] is Map) {
      product = json["product"] == null ? null : Product.fromJson(json["product"]);
    }
    if(json["price"] is int) {
      price = json["price"];
    }
    if(json["quantity"] is int) {
      quantity = json["quantity"];
    }
    if(json["_id"] is String) {
      id = json["_id"];
    }
  }

  static List<CartItems> fromList(List<Map<String, dynamic>> list) {
    return list.map(CartItems.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(product != null) {
      _data["product"] = product?.toJson();
    }
    _data["price"] = price;
    _data["quantity"] = quantity;
    _data["_id"] = id;
    return _data;
  }
}

class Product {
  int? rateAvg;
  int? rateCount;
  String? id;
  String? title;
  String? slug;
  String? description;
  String? imgCover;
  List<String>? images;
  int? price;
  int? priceAfterDiscount;
  int? quantity;
  String? category;
  String? occasion;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? discount;
  int? sold;
  

  Product({this.rateAvg, this.rateCount, this.id, this.title, this.slug, this.description, this.imgCover, this.images, this.price, this.priceAfterDiscount, this.quantity, this.category, this.occasion, this.createdAt, this.updatedAt, this.v, this.discount, this.sold, });

  Product.fromJson(Map<String, dynamic> json) {
    if(json["rateAvg"] is int) {
      rateAvg = json["rateAvg"];
    }
    if(json["rateCount"] is int) {
      rateCount = json["rateCount"];
    }
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["slug"] is String) {
      slug = json["slug"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["imgCover"] is String) {
      imgCover = json["imgCover"];
    }
    if(json["images"] is List) {
      images = json["images"] == null ? null : List<String>.from(json["images"]);
    }
    if(json["price"] is int) {
      price = json["price"];
    }
    if(json["priceAfterDiscount"] is int) {
      priceAfterDiscount = json["priceAfterDiscount"];
    }
    if(json["quantity"] is int) {
      quantity = json["quantity"];
    }
    if(json["category"] is String) {
      category = json["category"];
    }
    if(json["occasion"] is String) {
      occasion = json["occasion"];
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["__v"] is int) {
      v = json["__v"];
    }
    if(json["discount"] is int) {
      discount = json["discount"];
    }
    if(json["sold"] is int) {
      sold = json["sold"];
    }
    if(json["id"] is String) {
      id = json["id"];
    }
  }

  static List<Product> fromList(List<Map<String, dynamic>> list) {
    return list.map(Product.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["rateAvg"] = rateAvg;
    _data["rateCount"] = rateCount;
    _data["_id"] = id;
    _data["title"] = title;
    _data["slug"] = slug;
    _data["description"] = description;
    _data["imgCover"] = imgCover;
    if(images != null) {
      _data["images"] = images;
    }
    _data["price"] = price;
    _data["priceAfterDiscount"] = priceAfterDiscount;
    _data["quantity"] = quantity;
    _data["category"] = category;
    _data["occasion"] = occasion;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    _data["discount"] = discount;
    _data["sold"] = sold;
    _data["id"] = id;
    return _data;
  }
}