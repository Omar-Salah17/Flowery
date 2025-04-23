import 'package:flowery/features/profile/about_us/data/Models/about_us_model.dart';

abstract class AboutLocalDataSource{

  Future<AboutUsModel> getLocalAboutUsContent();
}