import 'package:dartz/dartz.dart';
import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/auth/register/data/models/register_request.dart';
import 'package:flowery/features/auth/register/domain/entities/register_entity.dart';
import 'package:flowery/features/auth/register/domain/repository/data_source_contract/remote/register_repository_data_source_contracr.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: RegisterRepositoryDataSourceContract)
class RegisterDataSourceImpl implements RegisterRepositoryDataSourceContract{  
  // object of the api service
  final apiServices = getIt<ApiService>();
  @override
  Future<Either<Failure, RegisterEntity>> register({required RegisterRequest registerRequest}) async {
  final either = await apiServices.registerUser(registerRequest);
return  either.fold((l) => Left(l), (r) => Right(r.toRegisterEntity()));
   
  }
}