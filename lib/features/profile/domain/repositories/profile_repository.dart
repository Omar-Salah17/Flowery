import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/profile/data/models/profile_response.dart';

abstract class ProfileRepository {
  Future<Either<Failure,ProfileResponse>> editProfile(UpdatedUserModel user);
  Future<Either<Failure,String>> uploadPhoto(File photo);
}