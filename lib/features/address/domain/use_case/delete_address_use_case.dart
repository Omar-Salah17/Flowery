import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/address/data/models/address_model.dart';
import 'package:flowery/features/address/domain/repos/address_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteAddressUseCase {
  final AddressRepo addressRepository;

  DeleteAddressUseCase(this.addressRepository);
  Future<Either<Failure, List<Address>?>> invoke(String addressId) async {
    return await addressRepository.deleteAddress(addressId: addressId);
  }
}
