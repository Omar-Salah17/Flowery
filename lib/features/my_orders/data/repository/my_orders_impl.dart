import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/my_orders/data/models/orders/order_item.dart';
import 'package:flowery/features/my_orders/data/models/orders/orders.dart';
import 'package:flowery/features/my_orders/data/remote/my_orders_remote_data_source.dart';
import 'package:flowery/features/my_orders/domain/repository/my_orders_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MyOrdersContract)
class MyOrdersImpl implements MyOrdersContract {
  MyOrdersRemoteDataSource myOrdersRemoteDataSource;
  MyOrdersImpl({required this.myOrdersRemoteDataSource});

  @override
  Future<Either<Failure, OrdersResponse>> getMyOrders() async {
    try {
      final data = await myOrdersRemoteDataSource.getMyOrders();
      log("data in MyOrdersImpl $data");
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log('error in MyOrdersImpl: $e');
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
