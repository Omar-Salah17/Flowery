
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flowery/features/profile/domain/repos/profile_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/error_handler.dart';


@injectable
class UploadPhotoUseCase {
  final ProfileRepo profileRepository;
  UploadPhotoUseCase(this.profileRepository);

  Future<Either<Failure,String>>call(File photo) async {
    return await profileRepository.uploadPhoto(photo);
  }

}
