import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/cart/data/models/get%20logged%20cart%20models/get_logged_cart_response.dart';

abstract class GetLoggedCartRepo {
  Future<Either<Failure, GetLoggedCartResponse>> getLoggedCart();
}
