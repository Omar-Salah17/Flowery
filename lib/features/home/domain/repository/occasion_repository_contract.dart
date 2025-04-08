import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/home/data/models/occaions.dart';

abstract class OccasionRepositoryContract {
  Future<Either<Failure, List<Occasions>>> getAllOccasions();
}