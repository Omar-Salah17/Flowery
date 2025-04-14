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
  var repo = MockProfileRepositoryContract();
    GetUserDataUseCase getUserDataUseCase = GetUserDataUseCase(
        profileRepositoryContract: repo,
      );

  test(
    'when call invoke from GetUserDataUseCase it should call getLoggedInUserData from profileRepositoryContract ',

    () {
      
    //object of UserData
      var result = UserData();
      when(repo.getLoggedInUserData()).thenAnswer((_) async => Right(result));
    
      getUserDataUseCase.invoke();
    }, 
    
  );
    test(
      "",
      () async {
        //arragne
        var result = ServerFailure(errorMessage: 'connection time out');
        when(
          repo.getLoggedInUserData(),
        ).thenAnswer((_) async => Left(result));
        //act
      var actual =  getUserDataUseCase.invoke();
        //assert
        verify(repo.getLoggedInUserData()).called(1);
        expect(actual, equals(Left(result)));
      },
    );
  
}
