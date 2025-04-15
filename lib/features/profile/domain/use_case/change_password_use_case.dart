import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/profile/domain/repos/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordUseCase {
  final ProfileRepo profileRepo;

  ChangePasswordUseCase({required this.profileRepo});
  Future<Either<Failure, Map<String, dynamic>>> call({required String oldPassword, required String newPassword}) async{
    return await profileRepo.changePassword({"password": oldPassword, "newPassword": newPassword});
  }
}
