import 'package:flowery/features/auth/register/data/models/register_request.dart';
import 'package:flowery/features/auth/register/data/models/register_response.dart';

abstract class RegisterRepositoryDataSourceContract {
  Future<RegisterResponse> register({required RegisterRequest registerRequest});
}
