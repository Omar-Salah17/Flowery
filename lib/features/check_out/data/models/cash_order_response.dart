import 'package:flowery/core/utils/models/products_model/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cash_order_response.g.dart';

@JsonSerializable()
class CashOrderResponse {
  final String? message;
  final OrderModel? order;

  CashOrderResponse({required this.message, required this.order});

  factory CashOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$CashOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CashOrderResponseToJson(this);
}

@JsonSerializable()
class OrderItemModel {
  final String? id;
  final Product? product;
  final int? price;
  final int? quantity;

  OrderItemModel({this.id, this.product, this.price, this.quantity});

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemModelToJson(this);
}

@JsonSerializable()
class OrderModel {
  final String? id;
  final String? user;
  final List<OrderItemModel>? orderItems;
  final int? totalPrice;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? state;
  final String? orderNumber;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  OrderModel({
    this.id,
    this.user,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.state,
    this.orderNumber,
    this.createdAt,
    this.updatedAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
