import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/auth/login/data/models/login_request.dart';
import 'package:flowery/features/auth/login/data/models/login_respose.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginResponse>> login({
    required LoginRequest loginRequest,
  });
}
