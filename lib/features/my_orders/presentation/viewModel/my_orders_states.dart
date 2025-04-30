import 'package:flowery/features/my_orders/data/models/orders/order_item.dart';
import 'package:flowery/features/my_orders/data/models/orders/orders.dart';

abstract class MyOrdersState {}

class MyOrdersInitial extends MyOrdersState {}

class MyOrdersLoading extends MyOrdersState {}

class MyOrdersSuccess extends MyOrdersState {
  final List<Orders> orders;
  MyOrdersSuccess({required this.orders});
}

class MyOrdersError extends MyOrdersState {
  final String message;
  MyOrdersError({required this.message});
}
