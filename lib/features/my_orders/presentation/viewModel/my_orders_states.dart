import 'package:flowery/features/my_orders/data/models/orders/order_item.dart';

abstract class MyOrdersState {}

class MyOrdersInitial extends MyOrdersState {}

class MyOrdersLoading extends MyOrdersState {}

class MyOrdersSuccess extends MyOrdersState {
  final List<OrderItem> orders;
  MyOrdersSuccess({required this.orders});
}

class MyOrdersError extends MyOrdersState {
  final String message;
  MyOrdersError({required this.message});
}
