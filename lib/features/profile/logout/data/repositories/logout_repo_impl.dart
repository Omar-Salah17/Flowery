import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/profile/logout/data/data_sources/logout_data_source.dart';
import 'package:flowery/features/profile/logout/domain/repositories/logout_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LogoutRepo)
class LogoutRepoImpl implements LogoutRepo {
  LogoutDataSource logoutDataSource;
  LogoutRepoImpl(this.logoutDataSource);

  @override
  Future<Either<Failure, String>> logout() async {
    try {
      final res = await logoutDataSource.logout();
      return right(res);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
