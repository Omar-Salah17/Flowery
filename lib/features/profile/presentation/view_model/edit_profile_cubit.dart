import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/features/profile/data/model/user_response.dart';
import 'package:flowery/features/profile/domain/use_case/edit_profile_use_case.dart';
import 'package:flowery/features/profile/domain/use_case/upload_photo__use_case.dart';
import 'package:flowery/features/profile/presentation/view_model/edit_profile_state.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileUseCase editProfileUseCase;
  final UploadPhotoUseCase uploadPhotoUseCase;

  EditProfileCubit(this.editProfileUseCase, this.uploadPhotoUseCase)
    : super(const EditProfileState());
    

  Future<void> uploadProfilePhoto(File? photo) async {
    try {
      emit(state.copyWith(status: EditProfileStatus.loading));

      await uploadPhotoUseCase(photo!);

      emit(state.copyWith(status: EditProfileStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          status: EditProfileStatus.failure,
          errorMessage: LocaleKeys.failedToUploadPhoto.tr(),
        ),
      );
    }
  }

  Future<void> editProfile(UpdatedUserModel updatedUser) async {
    emit(state.copyWith(status: EditProfileStatus.loading));

    final result = await editProfileUseCase(updatedUser);

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: EditProfileStatus.failure,
          errorMessage: failure.errorMessage,
        ),
      ),
      (profile) => emit(
        state.copyWith(status: EditProfileStatus.success, profile: profile),
      ),
    );
  }
}
