import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';

abstract class ForgetPasswordRepo {
  Future<Either<Failure, Map<String, dynamic>>> forgetPassword({
    required String email,
  });
  Future<Either<Failure, Map<String, dynamic>>> verifyCode({
    required String resetCode,
  });
  Future<Either<Failure, Map<String, dynamic>>> resetPassword({
    required String email,
    required String newPassword,
  });
}
