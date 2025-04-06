import 'package:flowery/core/utils/error_handler.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo {
  Future<Either<Failure, Map<String, dynamic>>> login({
    required String email,
    required String password,
  });
}
