import 'package:flowery/features/my_orders/data/models/orders/orders.dart';

abstract class MyOrdersRemoteDataSource {
  Future<OrdersResponse> getMyOrders();
}
