import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/auth/login/data/models/login_respose.dart';

abstract class ProfileRepositoryContract {
  Future<Either<Failure,User>> getLoggedInUserData();
}