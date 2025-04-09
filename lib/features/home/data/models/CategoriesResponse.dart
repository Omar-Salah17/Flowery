import 'package:json_annotation/json_annotation.dart';


part 'CategoriesResponse.g.dart';


@JsonSerializable()
class CategoryModel {
  CategoryModel({
      this.id, 
      this.name, 
      this.slug, 
      this.image, 
      this.createdAt, 
      this.updatedAt, 
      this.productsCount,
      this.message

  });

  String? message;
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
  num? productsCount;

  Map<String,dynamic> toJson()=>_$CategoryModelToJson(this);
  factory CategoryModel.fromJson(Map<String,dynamic> json)=> _$CategoryModelFromJson(json);
}

@JsonSerializable()
class CategoriesResponse{

  @JsonKey(name: 'categories')
  List<CategoryModel>? data;

  CategoriesResponse(this.data);
  Map<String,dynamic> toJson()=>_$CategoriesResponseToJson(this);
  factory CategoriesResponse.fromJson(Map<String,dynamic> json)=> _$CategoriesResponseFromJson(json);


}