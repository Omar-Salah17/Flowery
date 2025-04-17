import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/cart/data/models/get%20logged%20cart%20models/get_logged_cart_response.dart';
import 'package:flowery/features/cart/domain/repos/logged/get_logged_cart_repo.dart';

import 'package:injectable/injectable.dart';

@injectable
class GetLoggedCartUsecase {
  final GetLoggedCartRepo repo;

  GetLoggedCartUsecase({required this.repo});

  Future<Either<Failure, GetLoggedCartResponse>> invoke() async {
    return await repo.getLoggedCart();
  }
}
