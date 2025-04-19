// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/auth/register/data/models/register_request.dart';
import 'package:flowery/features/auth/register/domain/entities/register_entity.dart';
import 'package:flowery/features/auth/register/domain/repository/contract_repos/register_repository_contracr.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  RegisterRepositoryContracr registerRepositoryContracr;
  RegisterUseCase({required this.registerRepositoryContracr});
  Future<Either<Failure, RegisterEntity>> invoke({
    required RegisterRequest registerRequest,
  }) async {
    final either = await registerRepositoryContracr.register(
      registerRequest: registerRequest,
    );
    return either.fold((l) => Left(l), (r) => Right(r));
  }
}
