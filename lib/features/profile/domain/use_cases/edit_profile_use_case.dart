
import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/profile/data/models/profile_response.dart';
import 'package:flowery/features/profile/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfileUseCase {
  final ProfileRepository profileRepository;
  EditProfileUseCase(this.profileRepository);
  
  Future<Either<Failure,ProfileResponse>>call(UpdatedUserModel user) async {
    return await profileRepository.editProfile(user);
  }

}
