class OcaasionsResponse {
  String? message;
  Metadata? metadata;
  List<Occasions>? occasions;

  OcaasionsResponse({this.message, this.metadata, this.occasions});

  OcaasionsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata'] as Map<String, dynamic>) : null;
    if (json['occasions'] != null) {
      occasions = <Occasions>[];
      json['occasions'].forEach((v) {
        occasions!.add(Occasions.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    if (occasions != null) {
      data['occasions'] = occasions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Metadata {
  int? currentPage;
  int? limit;
  int? totalPages;
  int? totalItems;

  Metadata({this.currentPage, this.limit, this.totalPages, this.totalItems});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'] as int?;
    limit = json['limit'] as int?;
    totalPages = json['totalPages'] as int?;
    totalItems = json['totalItems'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['limit'] = limit;
    data['totalPages'] = totalPages;
    data['totalItems'] = totalItems;
    return data;
  }
}

class Occasions {
  String? sId;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? productsCount;

  Occasions({
    this.sId,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.productsCount,
  });

  Occasions.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] as String?;
    name = json['name'] as String?;
    slug = json['slug'] as String?;
    image = json['image'] as String?;
    createdAt = json['createdAt'] as String;
    updatedAt = json['updatedAt'] as String;
    productsCount = json['productsCount'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['slug'] = slug;
    data['image'] = image;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['productsCount'] = productsCount;
    return data;
  }
}
