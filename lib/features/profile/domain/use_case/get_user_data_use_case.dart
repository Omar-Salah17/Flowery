// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/profile/data/model/user_response.dart';
import 'package:flowery/features/profile/domain/repos/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserDataUseCase {
  final ProfileRepo profileRepositoryContract;
  GetUserDataUseCase({required this.profileRepositoryContract});
  Future<Either<Failure, UserData>> invoke() async {
    return await profileRepositoryContract.getLoggedInUserData();
  }
}
