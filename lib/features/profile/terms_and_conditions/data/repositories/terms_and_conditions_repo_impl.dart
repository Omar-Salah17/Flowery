import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/profile/terms_and_conditions/data/Models/terms_and_conditions_model.dart';
import 'package:flowery/features/profile/terms_and_conditions/data/data_sources/terms_and_conditions_local_datasource.dart';
import 'package:flowery/features/profile/terms_and_conditions/domain/repositories/terms_and_conditions_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TermsAndConditionsRepo)
class TermsAndConditionsRepoImpl implements TermsAndConditionsRepo{
  TermsAndConditionsLocalDataSource termsAndConditionsLocalDataSource;

  TermsAndConditionsRepoImpl(this.termsAndConditionsLocalDataSource);
  @override
  Future<Either<Failure, TermsAndConditionsModel>> getTermsAndConditions() async{
    try{
      var response = await termsAndConditionsLocalDataSource.getTermsAndConditions();
      return right(response);
    }catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log("error in aboutUsRepoImpl: ${e.toString()}");
        return left(ServerFailure(errorMessage: 'Something went wrong'));
      }
    }
  }
  }

