import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/cart/data/data%20sources/get%20logged/get_logged_data_source.dart';
import 'package:flowery/features/cart/data/models/get%20logged%20cart%20models/get_logged_cart_response.dart'
    show GetLoggedCartResponse;

import 'package:injectable/injectable.dart';

@Injectable(as: GetLoggedCartDataSource)
class GetLoggedCartDataSourceImp extends GetLoggedCartDataSource {
  final apiServices = getIt<ApiService>();

  @override
  Future<GetLoggedCartResponse> getLoggedCart() async {
    return await apiServices.getLoggedCart();
  }
}
