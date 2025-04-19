import 'package:flowery/features/address/data/models/address_model.dart';
import 'package:flowery/features/address/data/models/logged_user_address_model.dart';

abstract class AdderssRemoteDataSource {
  Future< List<Addresses>?> getLoggedUserAddress();
  Future< List<Address>?> deleteAddress({required String addressId});
}