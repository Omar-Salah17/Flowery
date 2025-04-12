import 'package:flowery/features/auth/login/data/models/login_respose.dart';

abstract class ProfileRemoteDataSourceContract {
Future<User> getLoggedInUserData();
}