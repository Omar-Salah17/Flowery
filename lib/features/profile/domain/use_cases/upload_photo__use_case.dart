
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/error_handler.dart';
import '../repositories/profile_repository.dart';

@injectable
class UploadPhotoUseCase {
  final ProfileRepository profileRepository;
  UploadPhotoUseCase(this.profileRepository);

  Future<Either<Failure,String>>call(File photo) async {
    return await profileRepository.uploadPhoto(photo);
  }

}
