import 'package:flowery/features/my_orders/data/models/orders/order.dart';
import 'package:flowery/features/my_orders/data/models/orders/order_item.dart';

abstract class MyOrdersRemoteDataSource {
  Future<List<Order>> getMyOrders();
}