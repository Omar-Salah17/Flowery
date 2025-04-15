import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/profile/data/model/user_response.dart';
import 'package:flowery/features/profile/domain/repos/profile_data_source_contract%20.dart';
import 'package:flowery/features/profile/domain/repos/profile_repository_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRepositoryContract)
class ProfileRepositoryImpl implements ProfileRepositoryContract {
  ProfileRemoteDataSourceContract profileRemoteDataSourceContract;
  ProfileRepositoryImpl(this.profileRemoteDataSourceContract);
  @override
  Future<Either<Failure, UserData>> getLoggedInUserData() async {

    try {
          var result = await profileRemoteDataSourceContract.getLoggedInUserData();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
