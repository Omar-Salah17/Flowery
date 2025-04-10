import 'package:flowery/features/auth/login/data/models/login_request.dart';
import 'package:flowery/features/auth/login/data/models/login_respose.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponse> login({required LoginRequest loginRequest});
}
