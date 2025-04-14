import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/cart/data/data%20sources/delete%20cart%20item/delete_cart_item_data_source.dart';
import 'package:flowery/features/cart/data/models/delete%20item%20models/delete_specific_item_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: DeleteCartItemDataSource)
class DeleteCartItemDataSourceImp extends DeleteCartItemDataSource {
  final apiService = getIt<ApiService>();

  @override
  Future<DeleteCartResponse> deleteCartItem({
    required String token,
    required String cartItemId,
  }) {
    return apiService.deleteCartItem(cartItemId, token);
  }
}
