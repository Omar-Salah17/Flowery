import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/address/data/models/logged_user_address_model.dart';
import 'package:flowery/features/address/domain/repos/repos/Address_repository_contract.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetLoggedUserAddressUseCase {
  final AddressRepositoryContract addressRepository;

  GetLoggedUserAddressUseCase(this.addressRepository);

  Future<Either<Failure, List<Addresses>?>> invoke()async {
    return await addressRepository.getLoggedUserAddress();
  }
}