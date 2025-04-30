import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/my_orders/data/models/orders/order_item.dart';
import 'package:flowery/features/my_orders/data/models/orders/orders.dart';

abstract class MyOrdersContract {
  Future<Either<Failure, List<Orders>>> getMyOrders();
}