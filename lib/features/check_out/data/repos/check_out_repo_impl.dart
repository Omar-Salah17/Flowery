import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/check_out/data/data_source/check_out_remote_data_source.dart';
import 'package:flowery/features/check_out/data/models/cash_order_response.dart';
import 'package:flowery/features/check_out/data/models/check_out_session_response.dart';
import 'package:flowery/features/check_out/data/models/shipping_address_model.dart';
import 'package:flowery/features/check_out/domain/repos/check_out_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CheckOutRepo)
class CheckOutRepoImpl implements CheckOutRepo {
  final CheckOutRemoteDataSource _checkOutRemoteDataSource;
  CheckOutRepoImpl(this._checkOutRemoteDataSource);
  @override
  Future<Either<Failure, CashOrderResponse>> cashCheckOut(
    ShippingAddressModel shippingAddressModel,
  ) async {
    try {
      final data = await _checkOutRemoteDataSource.cashCheckOut(
        shippingAddressModel,
      );
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log('error $e');
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CheckoutSessionResponse>> creditCheckOut(
    ShippingAddressModel shippingAddressModel,
  ) async {
    try {

      final data = await _checkOutRemoteDataSource.creditCheckOut(
        shippingAddressModel
      );
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log('error $e');
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
}

}
