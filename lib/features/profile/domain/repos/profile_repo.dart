import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';

abstract class ProfileRepo {
  Future<Either<Failure, Map<String, dynamic>>> changePassword(Map<String, dynamic> data);
}