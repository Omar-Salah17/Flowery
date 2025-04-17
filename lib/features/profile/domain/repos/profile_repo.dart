import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/profile/data/model/user_response.dart';

abstract class ProfileRepo {
  Future<Either<Failure, Map<String, dynamic>>> changePassword(
    Map<String, dynamic> data,
  );
  Future<Either<Failure, UserData>> getLoggedInUserData();
  Future<Either<Failure, UserResponse>> editProfile(UpdatedUserModel user);
  Future<Either<Failure, String>> uploadPhoto(File photo);
}
