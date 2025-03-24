import 'package:flowery/core/apiManger/api_manager.dart';
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
    var response = await apiManager.postData(
      endPoint: Constants.forgetPasswordEndPoint,
      data: {"email": email},
    );
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> verfiyCode({required String resetCode}) async {
    var response = await apiManager.postData(
      endPoint: Constants.verfiyCodeEndPoint,
      data: {"resetCode": resetCode},
    );
    return response.data;
  }
}
