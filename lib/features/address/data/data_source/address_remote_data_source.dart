import 'package:flowery/features/address/data/models/add_address_response/add_address_response.dart';
import 'package:flowery/features/address/data/models/address_model.dart';
import 'package:flowery/features/address/data/models/logged_user_address_model.dart';
import 'package:flowery/features/address/data/models/user_address_data.dart';

abstract class AddressRemoteDataSource {
  Future<List<Addresses>?> getLoggedUserAddress();
  Future<AddAddressResponse> addNewAddress(UserAddressData userAddressData);
  Future<AddAddressResponse> updateAddress(
    UserAddressData userAddressData,
    String? id,
  );

  Future<List<Address>?> deleteAddress({required String addressId});
}
