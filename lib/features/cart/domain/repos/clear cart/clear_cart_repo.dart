import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/cart/data/models/clear%20cart%20models/clear_cart_response.dart';

abstract class ClearCartRepo {
  Future<Either<Failure, ClearCartResponse>> clearCart();
}
