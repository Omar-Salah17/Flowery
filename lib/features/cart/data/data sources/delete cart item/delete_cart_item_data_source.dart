import 'package:flowery/features/cart/data/models/delete%20item%20models/delete_specific_item_response.dart';

abstract class DeleteCartItemDataSource {
  Future<DeleteCartResponse> deleteCartItem({required String cartItemId});
}
