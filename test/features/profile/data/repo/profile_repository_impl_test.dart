import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:flowery/features/profile/data/model/user_response.dart';
import 'package:flowery/features/profile/data/repos/profile_repo_impl.dart';
import 'package:flowery/features/profile/domain/repos/profile_repo.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_repository_impl_test.mocks.dart';

@GenerateMocks([ProfileRemoteDataSource])
void main() {
  group("Test ProfileRepositoryImpl", () {
    late ProfileRepo profileRepositoryContract;
    late ProfileRemoteDataSource remoteDataSourceContract;
    setUp(() {
      remoteDataSourceContract = MockProfileRemoteDataSource();
      // Initialize the ProfileRepositoryImpl with the mocked data source
      profileRepositoryContract = ProfileRepoImpl(
       remoteDataSource: remoteDataSourceContract,
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
