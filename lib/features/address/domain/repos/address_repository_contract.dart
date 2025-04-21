import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/address/data/models/add_address_response/add_address_response.dart';
import 'package:flowery/features/address/data/models/logged_user_address_model.dart';
import 'package:flowery/features/address/data/models/user_address_data.dart';

abstract class AddressRepositoryContract {
  Future<Either<Failure, List<Addresses>?>> getLoggedUserAddress();

  Future<Either<Failure, AddAddressResponse>> addAddress(UserAddressData address);
}