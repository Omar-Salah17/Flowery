

import 'package:flowery/core/api_manger/api_service.dart';
import 'package:flowery/features/check_out/data/data_source/check_out_remote_data_source.dart';
import 'package:flowery/features/check_out/data/models/cash_order_response.dart';
import 'package:flowery/features/check_out/data/models/check_out_session_response.dart';
import 'package:flowery/features/check_out/data/models/shipping_address_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CheckOutRemoteDataSource)
class CheckOutRemoteDataSourceImpl implements CheckOutRemoteDataSource {
  final ApiService _apiService;
  CheckOutRemoteDataSourceImpl(this._apiService);
  @override
  Future<CashOrderResponse> cashCheckOut(ShippingAddressModel shippingAddressModel) async {
  final response = await _apiService.cashCheckOut(shippingAddressModel);
    return response;

  }

  @override
  Future<CheckoutSessionResponse> creditCheckOut(ShippingAddressModel shippingAddressModel,) async {
    const uri = 'http://localhost:3000';
        final response = await _apiService.creditCheckOut(shippingAddressModel, uri);
    return response;

  }

}