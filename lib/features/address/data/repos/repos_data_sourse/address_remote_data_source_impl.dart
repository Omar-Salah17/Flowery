import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/features/address/data/models/logged_user_address_model.dart';
import 'package:flowery/features/address/domain/repos/repos_data_sourse/adderss_data_source_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AdderssRemoteDataSource)
class AddressRemoteDataSourceImpl implements AdderssRemoteDataSource {
  final ApiService apiService;

  AddressRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<Addresses>?> getLoggedUserAddress() async {
    var response = await apiService.getLoggedUserAddress();
    return response.addresses;
  }
}
