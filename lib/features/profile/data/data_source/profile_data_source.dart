import 'dart:io';

import 'package:flowery/features/profile/data/models/profile_response.dart';

abstract class ProfileDataSource {
  Future<ProfileResponse> editProfile(UpdatedUserModel user);
  Future<String> uploadPhoto(File photo);
}