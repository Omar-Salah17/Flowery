import 'package:flowery/features/profile/terms_and_conditions/data/Models/terms_and_conditions_model.dart';

abstract class TermsAndConditionsLocalDataSource {
  Future<TermsAndConditionsModel> getTermsAndConditions();
}
