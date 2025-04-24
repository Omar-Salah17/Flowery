import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/address/data/models/address_model.dart';
import 'package:flowery/features/address/domain/repos/address_repo.dart';
import 'package:flowery/features/address/domain/use_case/delete_address_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_logged_user_address_use_case_test.mocks.dart';

@GenerateMocks([AddressRepo])
void main() {
  group('get delete user address use case', () {
    late AddressRepo mockAdderssRemoteDataSource;
    late DeleteAddressUseCase deleteAddressUseCase;
    setUp(() {
      mockAdderssRemoteDataSource = MockAddressRepo();
      deleteAddressUseCase = DeleteAddressUseCase(mockAdderssRemoteDataSource);
    });
    test(
      'when call deleteAddressUseCase it should call deleteAddress from adderssRemoteDataSource and when call deleteAddress from adderssRemoteDataSource i expect to return Right<List<Address>>',
      () async {
        final result = <Address>[];
        const String addressId = "addressId";
        when(
          mockAdderssRemoteDataSource.deleteAddress(addressId: addressId),
        ).thenAnswer((_) async => Right(result));
        final response = await deleteAddressUseCase.invoke(addressId);
        verify(mockAdderssRemoteDataSource.deleteAddress(addressId: addressId));
        expect(response, Right(result));
      },
    );
    test(
      'when call deleteAddressUseCase it should call deleteAddress from adderssRemoteDataSource and when call deleteAddress from adderssRemoteDataSource i expect to return Left<Failure>',
      () async {
        const String addressId = "addressId";
        final failure = ServerFailure(errorMessage: 'error');
        when(
          mockAdderssRemoteDataSource.deleteAddress(addressId: addressId),
        ).thenAnswer((_) async => Left(failure));
        final response = await deleteAddressUseCase.invoke(addressId);
        verify(mockAdderssRemoteDataSource.deleteAddress(addressId: addressId));
        expect(response, Left(failure));
      },
    );
  });
}
