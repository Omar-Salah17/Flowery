import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/home/data/models/occasions_response.dart';

abstract class HomeOccasionsRepo {
  Future<Either<Failure, List<Occasions>>> getHomeOccasions();
}
