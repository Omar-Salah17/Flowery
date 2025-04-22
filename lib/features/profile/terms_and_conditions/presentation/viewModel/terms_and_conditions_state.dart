import 'package:flowery/features/profile/about_us/data/Models/about_us_model.dart';
import 'package:flowery/features/profile/terms_and_conditions/data/Models/terms_and_conditions_model.dart';

sealed class TermsAndConditionsState{}


class TermsAndConditionsInitState extends TermsAndConditionsState{}

class TermsAndConditionsLoadingState extends TermsAndConditionsState{}

class TermsAndConditionsFailureState extends TermsAndConditionsState{
  String errorMessage;
  TermsAndConditionsFailureState(this.errorMessage);
}

class TermsAndConditionsSuccessState extends TermsAndConditionsState{
  TermsAndConditionsModel termsAndConditionsModel;
  TermsAndConditionsSuccessState(this.termsAndConditionsModel);
}

