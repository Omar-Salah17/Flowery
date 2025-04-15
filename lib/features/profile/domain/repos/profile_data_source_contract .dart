import 'package:flowery/features/auth/login/data/models/login_respose.dart';
import 'package:flowery/features/profile/data/model/user_response.dart';

abstract class ProfileRemoteDataSourceContract {
Future<UserData> getLoggedInUserData();
}