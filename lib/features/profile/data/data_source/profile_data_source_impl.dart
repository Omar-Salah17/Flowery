import 'dart:io';

import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/features/profile/data/data_source/profile_data_source.dart';
import 'package:flowery/features/profile/data/models/profile_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:ProfileDataSource)
class ProfileDataSourceImpl implements ProfileDataSource{
  final ApiService apiService;
  ProfileDataSourceImpl(this.apiService);
  @override
  Future<ProfileResponse> editProfile(  UpdatedUserModel user) async {
   /// replace with the stored token later
    final String token =" Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjdlMzAxNWQ4MzZlZThiZTcwNjJlMzRhIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NDQ1NTQ0ODB9.Y-dBdQucs33WyzdhPJx5QuDEqGtU7AqcIhPr-vd17ko";
    final response = await apiService.editProfile(user,token);
    return response;
  }

  @override
  Future<String> uploadPhoto(File photo) async{
    /// replace with the stored token later
    final String token =" Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjdlMzAxNWQ4MzZlZThiZTcwNjJlMzRhIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NDQ1NTQ0ODB9.Y-dBdQucs33WyzdhPJx5QuDEqGtU7AqcIhPr-vd17ko";
    final response = await apiService.uploadPhoto(token,photo);
    return response;
  }

}