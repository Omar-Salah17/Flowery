import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/apiManger/api_manager.dart';
import 'package:flowery/core/utils/constants.dart';
import 'package:flowery/features/auth/forgetPassword/data/dataSource/forget_password_remot_data_source.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordRemoteDataSource)
class ForgetPasswordRemoteDataSourceImpl
    implements ForgetPasswordRemoteDataSource {
  final ApiManager apiManager;

  ForgetPasswordRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Map<String, dynamic>> forgetPassword({required String email}) async {
    var response = await apiManager.postData(
      endPoint: Constants.forgetPasswordEndPoint,
      data: {LocaleKeys.email: email},
    );
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> verfiyCode({required String resetCode}) async {
    var response = await apiManager.postData(
      endPoint: Constants.verfiyCodeEndPoint,
      data: {LocaleKeys.resetcode.tr(): resetCode},
    );
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    var response = await apiManager.putRequest(
      Constants.resetPasswordEndPoint,
      {LocaleKeys.email.tr(): email, LocaleKeys.newPassword.tr(): newPassword},
    );
    return response.data;
  }
}
