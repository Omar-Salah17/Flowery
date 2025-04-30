import 'package:flowery/features/my_orders/data/models/orders/order_item.dart';
import 'package:flowery/features/my_orders/data/models/orders/orders.dart';

abstract class MyOrdersRemoteDataSource {
  Future<List<Orders>> getMyOrders();
}