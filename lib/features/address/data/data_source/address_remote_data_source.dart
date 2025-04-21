import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/features/address/data/data_source/address_remote_data_source_impl.dart';
import 'package:flowery/features/address/data/models/add_address_response/add_address_response.dart';
import 'package:flowery/features/address/data/models/logged_user_address_model.dart';
import 'package:flowery/features/address/data/models/user_address_data.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddressRemoteDataSource)
class AddressRemoteDataSourceImpl implements AddressRemoteDataSource {
  final ApiService apiService;

  AddressRemoteDataSourceImpl({required this.apiService});
  @override
  Future<AddAddressResponse> addNewAddress(UserAddressData userAddressData)async {
   final response = await apiService.addNewAddress(userAddressData);
   return response;
  }
   @override
   Future<List<Addresses>?> getLoggedUserAddress() async {
    var response = await apiService.getLoggedUserAddress();
    return response.addresses;
  }
}
