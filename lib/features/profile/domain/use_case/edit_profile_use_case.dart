
import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/profile/data/model/user_response.dart';
import 'package:injectable/injectable.dart';

import '../repos/profile_repo.dart';

@injectable
class EditProfileUseCase {
  final ProfileRepo profileRepository;
  EditProfileUseCase(this.profileRepository);
  
  Future<Either<Failure,UserResponse>>call(UpdatedUserModel user) async {
    return await profileRepository.editProfile(user);
  }

}
