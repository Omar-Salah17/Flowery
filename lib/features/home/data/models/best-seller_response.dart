class BestSellerResponse {
  String? message;
  List<BestSeller>? bestSeller;

  BestSellerResponse({this.message, this.bestSeller});

  BestSellerResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['bestSeller'] != null) {
      bestSeller = <BestSeller>[];
      json['bestSeller'].forEach((v) {
        bestSeller!.add(BestSeller.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (bestSeller != null) {
      data['bestSeller'] = bestSeller!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BestSeller {
  String? sId;
  String? title;
  String? slug;
  String? description;
  String? imgCover;
  List<String>? images;
  int? price;
  int? priceAfterDiscount;
  int? quantity; //
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
    this.discount,
    this.sold,
    this.rateAvg,
    this.rateCount,
    this.id,
  });

  BestSeller.fromJson(Map<String, dynamic> json) {
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
    discount = json['discount'];
    sold = json['sold'];
    rateAvg =
        json['rateAvg'] != null ? (json['rateAvg'] as num).toDouble() : null;
    rateCount = json['rateCount'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['slug'] = slug;
    data['description'] = description;
    data['imgCover'] = imgCover;
    data['images'] = images;
    data['price'] = price;
    data['priceAfterDiscount'] = priceAfterDiscount;
    data['quantity'] = quantity;
    data['category'] = category;
    data['occasion'] = occasion;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['discount'] = discount;
    data['sold'] = sold;
    data['rateAvg'] = rateAvg;
    data['rateCount'] = rateCount;
    data['id'] = id;
    return data;
  }
}
