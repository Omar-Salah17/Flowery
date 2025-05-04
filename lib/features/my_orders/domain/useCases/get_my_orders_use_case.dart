import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/my_orders/data/models/orders/orders.dart';
import 'package:flowery/features/my_orders/domain/repository/my_orders_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMyOrdersUseCase {
  MyOrdersContract myOrdersContract;
  GetMyOrdersUseCase(this.myOrdersContract);

  Future<Either<Failure, OrdersResponse>> getMyOrders() async {
    return await myOrdersContract.getMyOrders();
  }
}
