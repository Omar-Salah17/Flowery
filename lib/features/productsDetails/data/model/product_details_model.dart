class ProductModel {
  String? message;
  List<BestSeller>? bestSeller;

  ProductModel({this.message,this.bestSeller});

  ProductModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['bestSeller'] != null) {
      bestSeller = <BestSeller>[];
      json['bestSeller'].forEach((v) {
        bestSeller!.add(new BestSeller.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.bestSeller != null) {
      data['bestSeller'] = this.bestSeller!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BestSeller {
//   String? sId;
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
  int? discount;
  int? sold;
  double? rateAvg;
  int? rateCount;
  String? id;

  BestSeller({
    // this.sId,
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
    this.discount,
    this.sold,
    this.rateAvg,
    this.rateCount,
    this.id,
  });

  BestSeller.fromJson(Map<String, dynamic> json) {
    // sId = json['_id'];
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
    discount = json['discount'];
    sold = json['sold'];
    rateAvg = json['rateAvg'];
    rateCount = json['rateCount'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['_id'] = this.sId;
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
    data['discount'] = this.discount;
    data['sold'] = this.sold;
    data['rateAvg'] = this.rateAvg;
    data['rateCount'] = this.rateCount;
    data['id'] = this.id;
    return data;
  }
}





// import 'package:json_annotation/json_annotation.dart';

// // part 'product.g.dart';

// @JsonSerializable()
// class Product {
//   final String id;
//   final String name;
//   final String description;
//   final double price;
//   final String imageUrl;

//   Product({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.price,
//     required this.imageUrl,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//     id: json["id"],
//     name: json["name"],
//     description: json["description"],
//     price: json["price"],
//     imageUrl: json["imageUrl"],
//   );
 
// }


