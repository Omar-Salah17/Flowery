import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'metadata.dart';
import 'order.dart';

part 'orders.g.dart';

@JsonSerializable()
class Orders {
  final String? message;
  final Metadata? metadata;
  final List<Order>? orders;

  const Orders({this.message, this.metadata, this.orders});

  @override
  String toString() {
    return 'Orders(message: $message, metadata: $metadata, orders: $orders)';
  }

  factory Orders.fromJson(Map<String, dynamic> json) {
    return _$OrdersFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrdersToJson(this);

  Orders copyWith({String? message, Metadata? metadata, List<Order>? orders}) {
    return Orders(
      message: message ?? this.message,
      metadata: metadata ?? this.metadata,
      orders: orders ?? this.orders,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Orders) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => message.hashCode ^ metadata.hashCode ^ orders.hashCode;
}
