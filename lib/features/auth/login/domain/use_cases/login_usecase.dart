import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/auth/login/data/models/login_request.dart';
import 'package:flowery/features/auth/login/data/models/login_respose.dart';
import 'package:flowery/features/auth/login/domain/repo/login_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUsecase {
  final LoginRepo repo;

  LoginUsecase({required this.repo});

  Future<Either<Failure, LoginResponse>> invoke({
    required LoginRequest loginRequest,
  }) async {
    log("before calling repo");
    return await repo.login(loginRequest: loginRequest);
  }
}
