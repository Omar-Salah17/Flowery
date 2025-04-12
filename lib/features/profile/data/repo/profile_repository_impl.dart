import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/auth/login/data/models/login_respose.dart';
import 'package:flowery/features/profile/domain/repos/profile_data_source_contract%20.dart';
import 'package:flowery/features/profile/domain/repos/profile_repository_contract.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ProfileRepositoryContract)
class ProfileRepositoryImpl implements ProfileRepositoryContract {
  ProfileRemoteDataSourceContract profileRemoteDataSourceContract;
  ProfileRepositoryImpl(this.profileRemoteDataSourceContract);
  @override
  Future<Either<Failure, User>> getLoggedInUserData() async {
var result = await profileRemoteDataSourceContract.getLoggedInUserData();
    try {
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  
}