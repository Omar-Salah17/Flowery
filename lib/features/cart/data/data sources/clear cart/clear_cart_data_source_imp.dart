import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/cart/data/data%20sources/clear%20cart/clear_cart_data_source.dart';
import 'package:flowery/features/cart/data/models/clear%20cart%20models/clear_cart_response.dart';

import 'package:injectable/injectable.dart';

@Injectable(as: ClearCartDataSource)
class ClearCartDataSourceImp extends ClearCartDataSource {
  final apiService = getIt<ApiService>();

  @override
  Future<ClearCartResponse> clearCart() {
    return apiService.clearCart();
  }
}
