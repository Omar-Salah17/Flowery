import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/logout_repo.dart';
import '../data_sources/logout_data_source.dart';

@Injectable(as: LogoutRepo)
class LogoutRepoImpl implements LogoutRepo{

  LogoutDataSource logoutDataSource;
  LogoutRepoImpl(this.logoutDataSource);

  @override
  Future<Either<Failure, String>> logout(String token)async{
    try{
      String bearerToken = "Bearer $token";
      var res = await logoutDataSource.logout(bearerToken);
      return right(res);
    }catch(e){
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }else{
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }

  }

}