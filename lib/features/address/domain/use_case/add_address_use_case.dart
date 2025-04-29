import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/address/data/models/add_address_response/add_address_response.dart';
import 'package:flowery/features/address/data/models/user_address_data.dart';
import 'package:flowery/features/address/domain/repos/address_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddAddressUseCase {
  final AddressRepo addressRepository;

  AddAddressUseCase({required this.addressRepository});
  Future<Either<Failure, AddAddressResponse>> call(
    UserAddressData addressData,
  ) async {
    return await addressRepository.addAddress(addressData);
  }
}
