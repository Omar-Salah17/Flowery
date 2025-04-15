import 'package:flowery/features/profile/data/model/user_response.dart';

abstract class ProfileRemoteDataSource {
  Future<Map<String, dynamic>> changePassword(Map<String, dynamic> data);
  Future<UserData> getLoggedInUserData();
}
