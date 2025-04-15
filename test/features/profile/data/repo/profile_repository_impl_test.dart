import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/profile/data/model/user_response.dart';
import 'package:flowery/features/profile/data/repo/profile_repository_impl.dart';
import 'package:flowery/features/profile/domain/repos/profile_data_source_contract%20.dart';
import 'package:flowery/features/profile/domain/repos/profile_repository_contract.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_repository_impl_test.mocks.dart';

@GenerateMocks([ProfileRemoteDataSourceContract])
void main() {
  group("Test ProfileRepositoryImpl", () {
    late ProfileRepositoryContract profileRepositoryContract;
    late ProfileRemoteDataSourceContract remoteDataSourceContract;
    setUp(() {
      remoteDataSourceContract = MockProfileRemoteDataSourceContract();
      // Initialize the ProfileRepositoryImpl with the mocked data source
      profileRepositoryContract = ProfileRepositoryImpl(
        remoteDataSourceContract,
      );
    });
    test(
      'when call getLoggedInUserData it should call getLoggedInUserData from remoteDataSource ',
      () async {
        var result = UserData();
        when(
          remoteDataSourceContract.getLoggedInUserData(),
        ).thenAnswer((_) async => result);
        var actual = await profileRepositoryContract.getLoggedInUserData();
        verify(remoteDataSourceContract.getLoggedInUserData()).called(1);
        // Check if the result is a Right<UserData>
        expect(actual.fold((l) => l, (r) => r), isA<UserData>());
      },
    );

    test(
      'when call getLoggedInUserData it should return Left<Failure> when an error occurs',
      () async {
        var error = ServerFailure(errorMessage: "error");
        when(remoteDataSourceContract.getLoggedInUserData()).thenThrow(error);
        var actual = await profileRepositoryContract.getLoggedInUserData();
        verify(remoteDataSourceContract.getLoggedInUserData()).called(1);
        // Check if the result is a Left<Failure>
        expect(actual.fold((l) => l, (r) => r), isA<ServerFailure>());
      },
    );
  });
}
