import 'package:flowery/features/cart/data/models/clear%20cart%20models/clear_cart_response.dart';

abstract class ClearCartDataSource {
  Future<ClearCartResponse> clearCart(String token);
}
