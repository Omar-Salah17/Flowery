
import 'package:json_annotation/json_annotation.dart';
part 'product_response_model.g.dart';

@JsonSerializable()
class ProductResponseModel {
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'metadata')
  Metadata? metadata;
  @JsonKey(name: 'products')
  List<Products>? products;

  ProductResponseModel({this.message, this.metadata, this.products});

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) => _$ProductResponseModelFromJson(json);

  static List<ProductResponseModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(ProductResponseModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$ProductResponseModelToJson(this);
}

@JsonSerializable()
class Products {
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
  

  Products({this.id, this.title, this.slug, this.description, this.imgCover, this.images, this.price, this.priceAfterDiscount, this.quantity, this.category, this.occasion, this.createdAt, this.updatedAt, this.v, this.discount, this.sold, this.rateAvg, this.rateCount});

  factory Products.fromJson(Map<String, dynamic> json) => _$ProductsFromJson(json);

  static List<Products> fromList(List<Map<String, dynamic>> list) {
    return list.map(Products.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: 'currentPage')
  int? currentPage;
  @JsonKey(name: 'totalPages')
  int? totalPages;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'totalItems')
  int? totalItems;

  Metadata({this.currentPage, this.totalPages, this.limit, this.totalItems});

  factory Metadata.fromJson(Map<String, dynamic> json) => _$MetadataFromJson(json);

  static List<Metadata> fromList(List<Map<String, dynamic>> list) {
    return list.map(Metadata.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}