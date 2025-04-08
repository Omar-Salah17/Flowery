import 'package:equatable/equatable.dart';

class Metadata extends Equatable {
  final int? currentPage;
  final int? limit;
  final int? totalPages;
  final int? totalItems;

  const Metadata({
    this.currentPage,
    this.limit,
    this.totalPages,
    this.totalItems,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    currentPage: json['currentPage'] as int?,
    limit: json['limit'] as int?,
    totalPages: json['totalPages'] as int?,
    totalItems: json['totalItems'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'currentPage': currentPage,
    'limit': limit,
    'totalPages': totalPages,
    'totalItems': totalItems,
  };

  @override
  List<Object?> get props => [currentPage, limit, totalPages, totalItems];
}
