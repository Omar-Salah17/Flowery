import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/profile/logout/domain/repositories/logout_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutUseCase {
  LogoutRepo logoutRepo;
  LogoutUseCase(this.logoutRepo);

  Future<Either<Failure, String>> call() async {
    return await logoutRepo.logout();
  }
}
