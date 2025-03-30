import 'package:equatable/equatable.dart';

import 'category.dart';
import 'metadata.dart';

class CategoriesModel extends Equatable {
  final String? message;
  final Metadata? metadata;
  final List<Category>? categories;

  const CategoriesModel({this.message, this.metadata, this.categories});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      message: json['message'] as String?,
      metadata:
          json['metadata'] == null
              ? null
              : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      categories:
          (json['categories'] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'metadata': metadata?.toJson(),
    'categories': categories?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [message, metadata, categories];
}
