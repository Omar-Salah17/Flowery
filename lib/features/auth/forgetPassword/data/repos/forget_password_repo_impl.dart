import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/auth/forgetPassword/data/dataSource/forget_password_remot_data_source.dart';
import 'package:flowery/features/auth/forgetPassword/domain/repos/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordRepo)
class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  final ForgetPasswordRemoteDataSource forgetPasswordRemoteDataSource;

  ForgetPasswordRepoImpl({required this.forgetPasswordRemoteDataSource});
  @override
  Future<Either<Failure, Map<String, dynamic>>> forgetPassword({
    required String email,
  }) async {
    try {
      var data = await forgetPasswordRemoteDataSource.forgetPassword(
        email: email,
      );
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log('error in forgetPasswordRepoImpl: ${e.toString()}');
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> verifyCode({
    required String resetCode,
  }) async {
    try {
      var data = await forgetPasswordRemoteDataSource.verfiyCode(
        resetCode: resetCode,
      );
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log('error in forgetPasswordRepoImpl verify code method: ${e.toString()}');
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
