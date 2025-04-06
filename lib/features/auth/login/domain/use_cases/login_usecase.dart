import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/auth/login/domain/repo/login_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUsecase {
  final LoginRepo repo;

  LoginUsecase({required this.repo});

  Future<Either<Failure, Map<String, dynamic>>> invoke({
    required String email,
    required String password,
  }) async {
    log("before calling repo");
    return await repo.login(email: email, password: password);
  }
}
