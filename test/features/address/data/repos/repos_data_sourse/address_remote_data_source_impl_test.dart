import 'package:flowery/core/api_manger/api_service.dart';

import 'package:flowery/features/address/data/models/address_model.dart';
import 'package:flowery/features/address/data/models/logged_user_address_model.dart';
import 'package:flowery/features/address/data/repos/repos_data_sourse/address_remote_data_source_impl.dart';
import 'package:flowery/features/address/domain/repos/repos_data_sourse/adderss_data_source_contract.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../profile/data/data_source/profile_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late ApiService apiServices;
  late AdderssRemoteDataSource addressRemoteDataSource;
  setUp(() {
    apiServices = MockApiService();
    addressRemoteDataSource = AddressRemoteDataSourceImpl(
      apiService: apiServices,
    );
  });
  group('test AddressRemoteDataSourceImpl', () {
    test(
      'when call getLoggedUserAddress it should call getLoggedUserAddress from apiService and when call getLoggedUserAddress from apiService i expect to return LoggedUserAddressModel ',
      () async {
        final addresses = <Addresses>[];
        when(
          apiServices.getLoggedUserAddress(),
        ).thenAnswer((_) async => LoggedUserAddressModel(addresses: addresses));
        final actual = await addressRemoteDataSource.getLoggedUserAddress();
        verify(apiServices.getLoggedUserAddress()).called(1);
        expect(actual, isA<List<Addresses>>());
      },
    );
    test(
      'when call deleteAddress it should call deleteAddress from apiService and when call deleteAddress from apiService i expect to return LoggedUserAddressModel ',
      () async {
        final addresses = <Address>[];
        when(
          apiServices.deleteAddress("addressId"),
        ).thenAnswer((_) async => AddressModel(address: addresses));
        final actual = await addressRemoteDataSource.deleteAddress(
          addressId: "addressId",
        );
        verify(apiServices.deleteAddress("addressId")).called(1);
        expect(actual, isA<List<Address>>());
      },
    );
  });
}
