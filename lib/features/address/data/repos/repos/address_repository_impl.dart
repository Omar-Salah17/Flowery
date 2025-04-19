import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/address/data/models/logged_user_address_model.dart';
import 'package:flowery/features/address/domain/repos/repos/Address_repository_contract.dart';
import 'package:flowery/features/address/domain/repos/repos_data_sourse/adderss_data_source_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddressRepositoryContract)
class AddressRepositoryImpl implements AddressRepositoryContract {
  final AdderssRemoteDataSource addressRemoteDataSource;

  AddressRepositoryImpl({required this.addressRemoteDataSource});
  @override
  Future<Either<Failure, List<Addresses>?>> getLoggedUserAddress() async {
    try {
      var response = await addressRemoteDataSource.getLoggedUserAddress();
      return right(response);
    } catch (e) {
      if (e is ServerFailure) {
        return left(e);
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
