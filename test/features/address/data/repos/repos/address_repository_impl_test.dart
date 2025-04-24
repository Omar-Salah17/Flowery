import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/address/data/data_source/address_remote_data_source.dart';
import 'package:flowery/features/address/data/models/address_model.dart';
import 'package:flowery/features/address/data/models/logged_user_address_model.dart';
import 'package:flowery/features/address/data/repos/address_repo_impl.dart';
import 'package:flowery/features/address/domain/repos/address_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'address_repository_impl_test.mocks.dart';

@GenerateMocks([AddressRemoteDataSource])
void main() {
  late MockAddressRemoteDataSource mockAdderssRemoteDataSource;
  late AddressRepo addressRepository;
  group('test AddressRepositoryImpl', () {
    setUp(() {
      // Initialize any necessary dependencies or mocks here
      mockAdderssRemoteDataSource = MockAddressRemoteDataSource();
      addressRepository = AddressRepoImpl(
        addressRemoteDataSource: mockAdderssRemoteDataSource,
      );
    });
    test(
      'when call getLoggedUserAddress it should call getLoggedUserAddress from adderssRemoteDataSource and when call getLoggedUserAddress from adderssRemoteDataSource i expect to return Right<List<Addresses>>',
      () async {
        final result = <Addresses>[];
        when(
          mockAdderssRemoteDataSource.getLoggedUserAddress(),
        ).thenAnswer((_) async => result);
        final actual = await addressRepository.getLoggedUserAddress();
        verify(mockAdderssRemoteDataSource.getLoggedUserAddress()).called(1);
        expect(actual, Right(result));
      },
    );
    test(
      'when call getLoggedUserAddress it should return Left<Failure> when an error occurs',
      () async {
        final error = ServerFailure(errorMessage: "error");
        when(
          mockAdderssRemoteDataSource.getLoggedUserAddress(),
        ).thenThrow(error);
        final actual = await addressRepository.getLoggedUserAddress();
        verify(mockAdderssRemoteDataSource.getLoggedUserAddress()).called(1);
        expect(actual.fold((l) => l, (r) => r), isA<ServerFailure>());
      },
    );
  });
  group('test deleteAddress', () {
    setUp(() {
      // Initialize any necessary dependencies or mocks here
      mockAdderssRemoteDataSource = MockAddressRemoteDataSource();
      addressRepository = AddressRepoImpl(
        addressRemoteDataSource: mockAdderssRemoteDataSource,
      );
    });
    test(
      'when call deleteAddress it should call deleteAddress from adderssRemoteDataSource and when call deleteAddress from adderssRemoteDataSource i expect to return Right<List<Addresses>>',
      () async {
        const String addressId = "addressId";
        final result = <Address>[];
        when(
          mockAdderssRemoteDataSource.deleteAddress(addressId: addressId),
        ).thenAnswer((_) async => result);
        final actual = await addressRepository.deleteAddress(
          addressId: addressId,
        );
        verify(
          mockAdderssRemoteDataSource.deleteAddress(addressId: addressId),
        ).called(1);
        expect(actual, Right(result));
      },
    );
    test(
      'when call getLoggedUserAddress it should return Left<Failure> when an error occurs',
      () async {
        const String addressId = "addressId";
        final error = ServerFailure(errorMessage: "error");
        when(
          mockAdderssRemoteDataSource.getLoggedUserAddress(),
        ).thenThrow(error);
        final actual = await addressRepository.deleteAddress(
          addressId: addressId,
        );
        verify(
          mockAdderssRemoteDataSource.deleteAddress(addressId: addressId),
        ).called(1);
        expect(actual.fold((l) => l, (r) => r), isA<ServerFailure>());
      },
    );
  });
}
