// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/auth/register/data/models/register_request.dart';
import 'package:flowery/features/auth/register/domain/entities/register_entity.dart';
import 'package:flowery/features/auth/register/domain/repository/contract_repos/register_repository_contracr.dart';
import 'package:flowery/features/auth/register/domain/repository/data_source_contract/remote/register_repository_data_source_contracr.dart';

@Injectable(as: RegisterRepositoryContracr)
class RegisterRepositoryImpl implements RegisterRepositoryContracr {
  RegisterRepositoryDataSourceContract repositoryDataSourceContract;
  RegisterRepositoryImpl({required this.repositoryDataSourceContract});
  @override
  Future<Either<Failure, RegisterEntity>> register({
    required RegisterRequest registerRequest,
  }) async {
    try {
      var response = await repositoryDataSourceContract.register(
        registerRequest: registerRequest,
      );
      return Right(response.toRegisterEntity());
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
