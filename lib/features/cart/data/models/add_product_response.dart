
import 'package:json_annotation/json_annotation.dart';
part 'add_product_response.g.dart';

@JsonSerializable()
class AddProductResponse {
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'numOfCartItems')
  int? numOfCartItems;
  @JsonKey(name: 'cart')
  Cart? cart;

  AddProductResponse({this.message, this.numOfCartItems, this.cart});

  factory AddProductResponse.fromJson(Map<String, dynamic> json) => _$AddProductResponseFromJson(json);

  static List<AddProductResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(AddProductResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$AddProductResponseToJson(this);
}

@JsonSerializable()
class Cart {
  @JsonKey(name: 'user')
  String? user;
  @JsonKey(name: 'cartItems')
  List<CartItems>? cartItems;
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'discount')
  int? discount;
  @JsonKey(name: 'totalPrice')
  int? totalPrice;
  @JsonKey(name: 'totalPriceAfterDiscount')
  int? totalPriceAfterDiscount;
  @JsonKey(name: 'createdAt')
  String? createdAt;
  @JsonKey(name: 'updatedAt')
  String? updatedAt;
  @JsonKey(name: '__v')
  int? v;

  Cart({this.user, this.cartItems, this.id, this.discount, this.totalPrice, this.totalPriceAfterDiscount, this.createdAt, this.updatedAt, this.v});

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  static List<Cart> fromList(List<Map<String, dynamic>> list) {
    return list.map(Cart.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$CartToJson(this);
}

@JsonSerializable()
class CartItems {
  @JsonKey(name: 'product')
  Product? product;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'quantity')
  int? quantity;
  @JsonKey(name: '_id')
  String? id;

  CartItems({this.product, this.price, this.quantity, this.id});

  factory CartItems.fromJson(Map<String, dynamic> json) => _$CartItemsFromJson(json);

  static List<CartItems> fromList(List<Map<String, dynamic>> list) {
    return list.map(CartItems.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$CartItemsToJson(this);
}

@JsonSerializable()
class Product {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'slug')
  String? slug;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'imgCover')
  String? imgCover;
  @JsonKey(name: 'images')
  List<String>? images;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'priceAfterDiscount')
  int? priceAfterDiscount;
  @JsonKey(name: 'quantity')
  int? quantity;
  @JsonKey(name: 'category')
  String? category;
  @JsonKey(name: 'occasion')
  String? occasion;
  @JsonKey(name: 'createdAt')
  String? createdAt;
  @JsonKey(name: 'updatedAt')
  String? updatedAt;
  @JsonKey(name: '__v')
  int? v;
  @JsonKey(name: 'discount')
  int? discount;
  @JsonKey(name: 'sold')
  int? sold;
  @JsonKey(name: 'rateAvg')
  double? rateAvg;
  @JsonKey(name: 'rateCount')
  int? rateCount;
  @JsonKey(name: 'id')
  

  Product({this.id, this.title, this.slug, this.description, this.imgCover, this.images, this.price, this.priceAfterDiscount, this.quantity, this.category, this.occasion, this.createdAt, this.updatedAt, this.v, this.discount, this.sold, this.rateAvg, this.rateCount, });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  static List<Product> fromList(List<Map<String, dynamic>> list) {
    return list.map(Product.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}