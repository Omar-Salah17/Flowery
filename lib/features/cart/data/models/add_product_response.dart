class AddProductResponse {
  String? message;
  int? numOfCartItems;
  Cart? cart;

  AddProductResponse({this.message, this.numOfCartItems, this.cart});

  AddProductResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cart = json['cart'] != null ? new Cart.fromJson(json['cart']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['numOfCartItems'] = this.numOfCartItems;
    if (this.cart != null) {
      data['cart'] = this.cart!.toJson();
    }
    return data;
  }
}

class Cart {
  String? sId;
  String? user;
  List<CartItems>? cartItems;
  int? discount;
  int? totalPrice;
  int? totalPriceAfterDiscount;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Cart({
    this.sId,
    this.user,
    this.cartItems,
    this.discount,
    this.totalPrice,
    this.totalPriceAfterDiscount,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  Cart.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    if (json['cartItems'] != null) {
      cartItems = <CartItems>[];
      json['cartItems'].forEach((v) {
        cartItems!.add(new CartItems.fromJson(v));
      });
    }
    discount = json['discount'];
    totalPrice = json['totalPrice'];
    totalPriceAfterDiscount = json['totalPriceAfterDiscount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    if (this.cartItems != null) {
      data['cartItems'] = this.cartItems!.map((v) => v.toJson()).toList();
    }
    data['discount'] = this.discount;
    data['totalPrice'] = this.totalPrice;
    data['totalPriceAfterDiscount'] = this.totalPriceAfterDiscount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class CartItems {
  ProductCart? product;
  int? price;
  int? quantity;
  String? sId;

  CartItems({this.product, this.price, this.quantity, this.sId});

  CartItems.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null
            ? new ProductCart.fromJson(json['product'])
            : null;
    price = json['price'];
    quantity = json['quantity'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['_id'] = this.sId;
    return data;
  }
}

class ProductCart {
  double? rateAvg;
  int? rateCount;
  String? sId;
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
  int? iV;
  int? sold;
  int? discount;
  String? id;

  ProductCart({
    this.rateAvg,
    this.rateCount,
    this.sId,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.category,
    this.occasion,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.sold,
    this.discount,
    this.id,
  });

  ProductCart.fromJson(Map<String, dynamic> json) {
    rateAvg = json['rateAvg'];
    rateCount = json['rateCount'];
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    imgCover = json['imgCover'];
    images = json['images'].cast<String>();
    price = json['price'];
    priceAfterDiscount = json['priceAfterDiscount'];
    quantity = json['quantity'];
    category = json['category'];
    occasion = json['occasion'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    sold = json['sold'];
    discount = json['discount'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rateAvg'] = this.rateAvg;
    data['rateCount'] = this.rateCount;
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['imgCover'] = this.imgCover;
    data['images'] = this.images;
    data['price'] = this.price;
    data['priceAfterDiscount'] = this.priceAfterDiscount;
    data['quantity'] = this.quantity;
    data['category'] = this.category;
    data['occasion'] = this.occasion;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['sold'] = this.sold;
    data['discount'] = this.discount;
    data['id'] = this.id;
    return data;
  }
}
