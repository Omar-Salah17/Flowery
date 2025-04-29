import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? imgCover;
  final List<String>? images;
  final int? price;
  final int? priceAfterDiscount;
  final int? quantity;
  final String? category;
  final String? occasion;
  final String? state;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  @JsonKey(name: '__v')
  final int? v;
  final int? discount;
  final int? sold;
  final double? rateAvg;
  final int? rateCount;

  const Product({
    this.id,
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
    this.state,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.discount,
    this.sold,
    this.rateAvg,
    this.rateCount,
  });

  @override
  String toString() {
    return 'Product(id: $id, title: $title, slug: $slug, description: $description, imgCover: $imgCover, images: $images, price: $price, priceAfterDiscount: $priceAfterDiscount, quantity: $quantity, category: $category, occasion: $occasion, state: $state, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, discount: $discount, sold: $sold, rateAvg: $rateAvg, rateCount: $rateCount, )';
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  Product copyWith({
    String? id,
    String? title,
    String? slug,
    String? description,
    String? imgCover,
    List<String>? images,
    int? price,
    int? priceAfterDiscount,
    int? quantity,
    String? category,
    String? occasion,
    String? state,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    int? discount,
    int? sold,
    double? rateAvg,
    int? rateCount,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      description: description ?? this.description,
      imgCover: imgCover ?? this.imgCover,
      images: images ?? this.images,
      price: price ?? this.price,
      priceAfterDiscount: priceAfterDiscount ?? this.priceAfterDiscount,
      quantity: quantity ?? this.quantity,
      category: category ?? this.category,
      occasion: occasion ?? this.occasion,
      state: state ?? this.state,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
      discount: discount ?? this.discount,
      sold: sold ?? this.sold,
      rateAvg: rateAvg ?? this.rateAvg,
      rateCount: rateCount ?? this.rateCount,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Product) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      slug.hashCode ^
      description.hashCode ^
      imgCover.hashCode ^
      images.hashCode ^
      price.hashCode ^
      priceAfterDiscount.hashCode ^
      quantity.hashCode ^
      category.hashCode ^
      occasion.hashCode ^
      state.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      v.hashCode ^
      discount.hashCode ^
      sold.hashCode ^
      rateAvg.hashCode ^
      rateCount.hashCode;
}
