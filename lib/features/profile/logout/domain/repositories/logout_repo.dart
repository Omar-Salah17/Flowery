import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';

abstract class LogoutRepo{
  Future<Either<Failure,String>> logout();
}