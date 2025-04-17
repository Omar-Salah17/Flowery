import 'package:equatable/equatable.dart';

class Product extends Equatable {
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
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final int? discount;
  final int? sold;
  final double? rateAvg;
  final int? rateCount;
  // final String? id;

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
    this.createdAt,
    this.updatedAt,
    this.v,
    this.discount,
    this.sold,
    this.rateAvg,
    this.rateCount,
    // this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['_id'] as String?,
    title: json['title'] as String?,
    slug: json['slug'] as String?,
    description: json['description'] as String?,
    imgCover: json['imgCover'] as String?,
    images: json['images'] as List<String>?,
    price: json['price'] as int?,
    priceAfterDiscount: json['priceAfterDiscount'] as int?,
    quantity: json['quantity'] as int?,
    category: json['category'] as String?,
    occasion: json['occasion'] as String?,
    createdAt:
        json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
    updatedAt:
        json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
    v: json['__v'] as int?,
    discount: json['discount'] as int?,
    sold: json['sold'] as int?,
    rateAvg: (json['rateAvg'] as num?)?.toDouble(),
    rateCount: json['rateCount'] as int?,
    // id: json['id'] as String?,
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'title': title,
    'slug': slug,
    'description': description,
    'imgCover': imgCover,
    'images': images,
    'price': price,
    'priceAfterDiscount': priceAfterDiscount,
    'quantity': quantity,
    'category': category,
    'occasion': occasion,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    '__v': v,
    'discount': discount,
    'sold': sold,
    'rateAvg': rateAvg,
    'rateCount': rateCount,
    // 'id': id,
  };

  @override
  List<Object?> get props {
    return [
      id,
      title,
      slug,
      description,
      imgCover,
      images,
      price,
      priceAfterDiscount,
      quantity,
      category,
      occasion,
      createdAt,
      updatedAt,
      v,
      discount,
      sold,
      rateAvg,
      rateCount,
      // id,
    ];
  }
}
