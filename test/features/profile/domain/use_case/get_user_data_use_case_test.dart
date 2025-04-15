import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/profile/data/model/user_response.dart';
import 'package:flowery/features/profile/domain/repos/profile_repository_contract.dart';
import 'package:flowery/features/profile/domain/use_case/get_user_data_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_user_data_use_case_test.mocks.dart';

@GenerateMocks([ProfileRepositoryContract])
void main() {
  group("Test GetUserDataUseCase", () {
    late MockProfileRepositoryContract repo;
    late GetUserDataUseCase getUserDataUseCase;
    setUp(() {
      // Initialize the mock repository before each test
      repo = MockProfileRepositoryContract();
      getUserDataUseCase = GetUserDataUseCase(profileRepositoryContract: repo);
    });
    test(
      'when call invoke from GetUserDataUseCase it should call getLoggedInUserData from profileRepositoryContract and when call getLoggedInUserData from profileRepositoryContract i expect to return Right<UserData> ',

      () async {
        //object of UserData
        var result = UserData();
        when(repo.getLoggedInUserData()).thenAnswer((_) async => Right(result));

        var actual = await getUserDataUseCase.invoke();
        verify(repo.getLoggedInUserData()).called(1);
        expect(actual, equals(Right(result)));
        //here im checking if the getLoggedInUserData from profileRepositoryContract was called for one time
      },
    );
    test(
      "when call invoke from GetUserDataUseCase it should call getLoggedInUserData from profileRepositoryContract and when call getLoggedInUserData from profileRepositoryContract i expect to return Left<Failure> ",
      () async {
        //object of Failure
        var result = ServerFailure(errorMessage: "error");
        when(repo.getLoggedInUserData()).thenAnswer((_) async => Left(result));
        var actual = await getUserDataUseCase.invoke();

        verify(repo.getLoggedInUserData()).called(1);
        expect(actual, equals(Left(result)));
      },
    );
  });
}
