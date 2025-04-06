import 'dart:developer';

import 'package:flowery/core/apiManger/api_manager.dart';
import 'package:flowery/core/utils/constants.dart';
import 'package:flowery/features/auth/login/data/dataSources/login_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImp implements LoginRemoteDataSource {
  final ApiManager apiManager;
  LoginRemoteDataSourceImp({required this.apiManager});

  @override
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    log("before calling api manager");
    log(email);
    log(password);
    var response = await apiManager.postData(
      endPoint: Constants.loginEndPoint,
      data: {"email": email, "password": password},
    );
    log("after calling api manager");

    return response.data;
  }
}
