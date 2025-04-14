import 'package:flowery/features/cart/data/models/get%20logged%20cart%20models/get_logged_cart_response.dart';

abstract class GetLoggedCartDataSource {
  Future<GetLoggedCartResponse> getLoggedCart({required String token});
}
