import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/profile/about_us/data/Models/about_us_model.dart';
import 'package:flowery/features/profile/about_us/data/data_sources/about_us_local_data_source.dart';
import 'package:flowery/features/profile/about_us/domain/repositories/about_us_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AboutRepository)
class AboutRepoImpl implements AboutRepository {
  AboutLocalDataSource aboutLocalDataSource;
  AboutRepoImpl(this.aboutLocalDataSource);
  @override
  Future<Either<Failure, AboutUsModel>> getAboutUsContent() async {
    try {
      var response = await aboutLocalDataSource.getLocalAboutUsContent();
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log("error in aboutUsRepoImpl: ${e.toString()}");
        return left(ServerFailure(errorMessage: 'Something went wrong'));
      }
    }
  }
}
