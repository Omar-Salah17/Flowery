import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'order_item.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  @JsonKey(name: '_id')
  final String? id;
  final String? user;
  final List<OrderItem>? orderItems;
  final int? totalPrice;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? state;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? orderNumber;
  @JsonKey(name: '__v')
  final int? v;

  const Order({
    this.id,
    this.user,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.orderNumber,
    this.v,
  });

  @override
  String toString() {
    return 'Order(id: $id, user: $user, orderItems: $orderItems, totalPrice: $totalPrice, paymentType: $paymentType, isPaid: $isPaid, isDelivered: $isDelivered, state: $state, createdAt: $createdAt, updatedAt: $updatedAt, orderNumber: $orderNumber, v: $v)';
  }

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

  Order copyWith({
    String? id,
    String? user,
    List<OrderItem>? orderItems,
    int? totalPrice,
    String? paymentType,
    bool? isPaid,
    bool? isDelivered,
    String? state,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? orderNumber,
    int? v,
  }) {
    return Order(
      id: id ?? this.id,
      user: user ?? this.user,
      orderItems: orderItems ?? this.orderItems,
      totalPrice: totalPrice ?? this.totalPrice,
      paymentType: paymentType ?? this.paymentType,
      isPaid: isPaid ?? this.isPaid,
      isDelivered: isDelivered ?? this.isDelivered,
      state: state ?? this.state,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      orderNumber: orderNumber ?? this.orderNumber,
      v: v ?? this.v,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Order) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      user.hashCode ^
      orderItems.hashCode ^
      totalPrice.hashCode ^
      paymentType.hashCode ^
      isPaid.hashCode ^
      isDelivered.hashCode ^
      state.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      orderNumber.hashCode ^
      v.hashCode;
}
