import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/profile/terms_and_conditions/data/Models/terms_and_conditions_model.dart';
import 'package:flowery/features/profile/terms_and_conditions/domain/repositories/terms_and_conditions_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class TermsAndConditionsUseCase {
  TermsAndConditionsRepo termsAndConditionsRepo;
  TermsAndConditionsUseCase(this.termsAndConditionsRepo);
  Future<Either<Failure, TermsAndConditionsModel>> call() async {
    return await termsAndConditionsRepo.getTermsAndConditions();
  }
}
