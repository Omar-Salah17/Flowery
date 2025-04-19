
import 'package:flowery/core/api_manger/api_manager.dart';
import 'package:flowery/core/utils/constants.dart';
import 'package:flowery/features/auth/forgetPassword/data/dataSource/forget_password_remot_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordRemoteDataSource)
class ForgetPasswordRemoteDataSourceImpl
    implements ForgetPasswordRemoteDataSource {
  final ApiManager apiManager;

  ForgetPasswordRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Map<String, dynamic>> forgetPassword({required String email}) async {
    final response = await apiManager.postData(
      endPoint: Constants.forgetPasswordEndPoint,
      data: {"email": email},
    );
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> verfiyCode({required String resetCode}) async {
    final response = await apiManager.postData(
      endPoint: Constants.verfiyCodeEndPoint,
      data: {"resetCode": resetCode},
    );
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    final response = await apiManager.putRequest(
      Constants.resetPasswordEndPoint,
      {"email": email, "newPassword": newPassword},
    );
    return response.data as Map<String, dynamic>;
  }
}
