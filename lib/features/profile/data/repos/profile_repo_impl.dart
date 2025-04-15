import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/profile/data/data_source/profile_remote_data_source.dart';
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
      var response = await remoteDataSource.changePassword(data);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log('error in ProfileRepoImpl changePassword method: ${e.toString()}');
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
