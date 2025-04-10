import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/auth/login/data/dataSources/login_remote_data_source.dart';
import 'package:flowery/features/auth/login/data/models/login_request.dart';
import 'package:flowery/features/auth/login/data/models/login_respose.dart';
import 'package:flowery/features/auth/login/domain/repo/login_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepo)
class LoginRepoImp implements LoginRepo {
  final LoginRemoteDataSource loginRemoteDataSource;
  LoginRepoImp({required this.loginRemoteDataSource});

  @override
  Future<Either<Failure, LoginResponse>> login({
    required LoginRequest loginRequest,
  }) async {
    try {
      log("before calling datasource");
      var data = await loginRemoteDataSource.login(loginRequest: loginRequest);
      log("after calling datasource");
      return Right(data);
    } catch (e) {
      log("repo exc ");
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log('error in forgetPasswordRepoImpl: ${e.toString()}');
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
