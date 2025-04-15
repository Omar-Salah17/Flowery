
import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/error_handler.dart';
import '../repositories/logout_repo.dart';

@injectable
class LogoutUseCase{
  LogoutRepo logoutRepo;
  LogoutUseCase(this.logoutRepo);

  Future<Either<Failure,String>> call(String token)async{
    return await logoutRepo.logout(token);
  }

}