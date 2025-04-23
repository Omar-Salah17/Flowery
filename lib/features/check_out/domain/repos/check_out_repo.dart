import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/check_out/data/models/cash_order_response.dart';
import 'package:flowery/features/check_out/data/models/check_out_session_response.dart';
import 'package:flowery/features/check_out/data/models/shipping_address_model.dart';

abstract class CheckOutRepo {
  Future <Either<Failure,CashOrderResponse>>cashCheckOut(ShippingAddressModel shippingAddressModel);
  Future <Either<Failure,CheckoutSessionResponse>>creditCheckOut(ShippingAddressModel shippingAddressModel);

}
