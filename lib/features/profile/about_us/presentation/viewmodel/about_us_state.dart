
import 'package:flowery/features/profile/about_us/data/Models/about_us_model.dart';

sealed class AboutUsState{}


class AboutUsInitState extends AboutUsState{}



class AboutUsLoadingState extends AboutUsState{}



class AboutUsFailureState extends AboutUsState{
  String errorMessage;
  AboutUsFailureState(this.errorMessage);
}

class AboutUsSuccessState extends AboutUsState{
  AboutUsModel aboutUs;
  AboutUsSuccessState(this.aboutUs);
}


