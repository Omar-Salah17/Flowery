import 'package:flowery/core/api_manger/api_service.dart';
import 'package:flowery/features/my_orders/data/models/orders/order_item.dart';
import 'package:flowery/features/my_orders/data/remote/my_orders_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MyOrdersRemoteDataSource)
class MyOrdersRemoteDataSourceImpl implements MyOrdersRemoteDataSource {
  ApiService apiService;
  MyOrdersRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<OrderItem>> getMyOrders() {
    final response = apiService.getMyOrders();
    return response;
  }
}
