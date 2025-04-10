import 'dart:developer';

import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/core/apiManger/api_manager.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/auth/login/data/dataSources/login_remote_data_source.dart';
import 'package:flowery/features/auth/login/data/models/login_request.dart';
import 'package:flowery/features/auth/login/data/models/login_respose.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImp implements LoginRemoteDataSource {
  final apiServices = getIt<ApiService>();
  final ApiManager apiManager;
  LoginRemoteDataSourceImp({required this.apiManager});

  @override
  Future<LoginResponse> login({required LoginRequest loginRequest}) async {
    log("before calling api manager");
    log(loginRequest.email); // Notice the updated name here
    log(loginRequest.password); // Notice the updated name here
    var response = await apiServices.loginUser(loginRequest);
    log("after calling api manager");

    return response;
  }
}
