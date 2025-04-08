
import 'package:json_annotation/json_annotation.dart';
part 'occaions.g.dart';

@JsonSerializable()
class AllOccaions {
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'metadata')
  Metadata? metadata;
  @JsonKey(name: 'occasions')
  List<Occasions>? occasions;

  AllOccaions({this.message, this.metadata, this.occasions});

  factory AllOccaions.fromJson(Map<String, dynamic> json) => _$AllOccaionsFromJson(json);

  static List<AllOccaions> fromList(List<Map<String, dynamic>> list) {
    return list.map(AllOccaions.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$AllOccaionsToJson(this);
}

@JsonSerializable()
class Occasions {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'slug')
  String? slug;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'createdAt')
  String? createdAt;
  @JsonKey(name: 'updatedAt')
  String? updatedAt;
  @JsonKey(name: 'productsCount')
  int? productsCount;

  Occasions({this.id, this.name, this.slug, this.image, this.createdAt, this.updatedAt, this.productsCount});

  factory Occasions.fromJson(Map<String, dynamic> json) => _$OccasionsFromJson(json);

  static List<Occasions> fromList(List<Map<String, dynamic>> list) {
    return list.map(Occasions.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$OccasionsToJson(this);
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: 'currentPage')
  int? currentPage;
  @JsonKey(name: 'limit')
  int? limit;
  @JsonKey(name: 'totalPages')
  int? totalPages;
  @JsonKey(name: 'totalItems')
  int? totalItems;

  Metadata({this.currentPage, this.limit, this.totalPages, this.totalItems});

  factory Metadata.fromJson(Map<String, dynamic> json) => _$MetadataFromJson(json);

  static List<Metadata> fromList(List<Map<String, dynamic>> list) {
    return list.map(Metadata.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}