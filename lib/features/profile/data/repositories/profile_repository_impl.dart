
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/profile/data/data_source/profile_data_source.dart';

import 'package:flowery/features/profile/data/models/profile_response.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/profile_repository.dart';

@Injectable(as: ProfileRepository)

class ProfileRepositoryImpl implements ProfileRepository{

  ProfileDataSource profileDataSource;
  ProfileRepositoryImpl(this.profileDataSource);
  @override
  Future<Either<Failure, ProfileResponse>> editProfile( UpdatedUserModel user) async {
    try{
      var data = await profileDataSource.editProfile(user);
    return Right(data);
    }catch (e){
      if(e is DioException){
        return left(ServerFailure.fromDioException(e));
      }else {
        log('error  ${e.toString()}');
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> uploadPhoto(File photo) async{
    try{
      if(await photo.exists()){
        print(" file exists. path: ${photo.path}");
      } else {
        print("file doesn't exist.");
      }
      var data = await profileDataSource.uploadPhoto(photo);
      return Right(data);
    }catch (e){
      if(e is DioException){
        return left(ServerFailure.fromDioException(e));
      }else {
        log('error  ${e.toString()}');
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }


  }

}