import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/profile/terms_and_conditions/data/Models/terms_and_conditions_model.dart';

abstract class TermsAndConditionsRepo{
  Future<Either<Failure,TermsAndConditionsModel>> getTermsAndConditions();
}