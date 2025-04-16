// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/core/apiManger/api_manager.dart';
import 'package:flowery/core/utils/constants.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:flowery/features/profile/data/model/user_response.dart';

import 'package:injectable/injectable.dart';


@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
   ApiManager apiManager = ApiManager();
  ApiService apiService;
  ProfileRemoteDataSourceImpl( {required this.apiService});
  @override

  Future<UserData> getLoggedInUserData() async {
    var response = await apiService.getLoggedInUserData();
    if (response.message == "success") {
      return response.user!;
    } else {
      throw ServerFailure(errorMessage: response.message!);
    }
  }

  @override
  Future<Map<String, dynamic>> changePassword(Map<String, dynamic> data)async {
 var response =await  apiManager.patchRequest(Constants.changePasswordEndPoint, data);
    return response.data;
  }

   Future<UserResponse> editProfile(  UpdatedUserModel user) async {
  final response = await apiService.editProfile(user,);
     return response;
   }

   @override
   Future<String> uploadPhoto(File photo) async{



       final response = await apiService.uploadPhoto(photo);
     return response;
   }
}
