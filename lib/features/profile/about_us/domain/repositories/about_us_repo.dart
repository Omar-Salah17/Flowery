import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/profile/about_us/data/Models/about_us_model.dart';

abstract class AboutRepository {
  Future<Either<Failure, AboutUsModel>> getAboutUsContent();
}
