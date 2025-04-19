import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:flowery/features/profile/data/model/user_response.dart';
import 'package:flowery/features/profile/domain/repos/profile_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepoImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, Map<String, dynamic>>> changePassword(
    Map<String, dynamic> data,
  ) async {
    try {
      final response = await remoteDataSource.changePassword(data);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log('error in ProfileRepoImpl changePassword method: $e');
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserData>> getLoggedInUserData() async {
    try {
      final result = await remoteDataSource.getLoggedInUserData();
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log(
          'error in ProfileRepoImpl in getLoggedInUserData method: $e',
        );
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserResponse>> editProfile(
    UpdatedUserModel user,
  ) async {
    try {
      final data = await remoteDataSource.editProfile(user);
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log('error  $e');
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> uploadPhoto(File photo) async {
    try {
      if (await photo.exists()) {
        log(" file exists. path: ${photo.path}");
      } else {
        log("file doesn't exist.");
      }
      final data = await remoteDataSource.uploadPhoto(photo);
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log('error  $e');
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
