import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/auth/register/data/models/register_request.dart';
import 'package:flowery/features/auth/register/data/models/register_response.dart';
import 'package:flowery/features/auth/register/domain/entities/register_entity.dart';

abstract class RegisterRepositoryDataSourceContract {
  Future<RegisterResponse> register({ required RegisterRequest registerRequest});
}