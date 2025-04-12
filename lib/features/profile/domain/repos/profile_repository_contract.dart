import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/auth/login/data/models/login_respose.dart';
import 'package:flowery/features/profile/data/model/user_response.dart';

abstract class ProfileRepositoryContract {
  Future<Either<Failure,UserData>> getLoggedInUserData();
}