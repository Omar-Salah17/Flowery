import 'dart:developer';

import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/cart/data/data%20sources/update%20product%20quantity/update_product_data_source.dart';
import 'package:flowery/features/cart/data/models/update%20product%20models/update_product_request.dart';
import 'package:flowery/features/cart/data/models/update%20product%20models/update_product_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UpdateProductDataSource)
class UpdateProductDataSourceImp implements UpdateProductDataSource {
  final apiServices = getIt<ApiService>();

  @override
  Future<UpdateCartResponse> updateCartItem(
    String cartItemId,
    UpdateProductRequest request,
  ) async {
    log(cartItemId);
    log(request.quantity.toString());
    return await apiServices.updateCartProductQuantity(cartItemId, request);
  }
}
