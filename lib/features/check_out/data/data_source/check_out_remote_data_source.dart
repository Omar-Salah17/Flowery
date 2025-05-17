import 'package:flowery/features/check_out/data/models/cash_order_response.dart';
import 'package:flowery/features/check_out/data/models/check_out_session_response.dart';
import 'package:flowery/features/check_out/data/models/shipping_address_model.dart';

abstract class CheckOutRemoteDataSource {
  Future<CheckoutSessionResponse> creditCheckOut(
    ShippingAddressModel shippingAddressModel,
  );
  Future<CashOrderResponse> cashCheckOut(
    ShippingAddressModel shippingAddressModel,
  );
}
