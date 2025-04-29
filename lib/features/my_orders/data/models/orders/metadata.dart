import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metadata.g.dart';

@JsonSerializable()
class Metadata {
  final int? currentPage;
  final int? totalPages;
  final int? limit;
  final int? totalItems;

  const Metadata({
    this.currentPage,
    this.totalPages,
    this.limit,
    this.totalItems,
  });

  @override
  String toString() {
    return 'Metadata(currentPage: $currentPage, totalPages: $totalPages, limit: $limit, totalItems: $totalItems)';
  }

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return _$MetadataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MetadataToJson(this);

  Metadata copyWith({
    int? currentPage,
    int? totalPages,
    int? limit,
    int? totalItems,
  }) {
    return Metadata(
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      limit: limit ?? this.limit,
      totalItems: totalItems ?? this.totalItems,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Metadata) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      currentPage.hashCode ^
      totalPages.hashCode ^
      limit.hashCode ^
      totalItems.hashCode;
}
