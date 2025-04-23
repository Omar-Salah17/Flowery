import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/profile/domain/repos/profile_repo.dart';
import 'package:flowery/features/profile/domain/use_case/change_password_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'change_password_use_case_test.mocks.dart';

@GenerateMocks([ProfileRepo])
void main() {
  late ChangePasswordUseCase useCase;
  late ProfileRepo mockProfileRepo;
  setUpAll(() {
    mockProfileRepo = MockProfileRepo();
    useCase = ChangePasswordUseCase(profileRepo: mockProfileRepo);
  });
  const String oldPass = "oldPassword";
  const String newPass = "newPassword";
  final Map<String, dynamic> successResponse = {
    "message": "Password changed successfully"
  };
  final Failure failureResponse = ServerFailure(
    errorMessage: "Password change failed"
  );
 
  group("Test ChangePasswordUseCase", () {
    test(
      'test that when i trigger call method from ChangePasswordUseCase it calles for one time and test ChangePasswordUseCase success state',
      () async {
        //arrange
        when(
          mockProfileRepo.changePassword({
            "password": oldPass,
            "newPassword": newPass,
          }),
        ).thenAnswer((_) async => Right(successResponse));
        //act
        final actual = await useCase.call(
          oldPassword: oldPass,
          newPassword: newPass,
        );
        //assert
        verify(
          mockProfileRepo.changePassword({
            "password": oldPass,
            "newPassword": newPass,
          }),
        ).called(1);
        expect(actual, equals(Right(successResponse)));
      },
    );

    test("test ChangePasswordUseCase failure state", () async {
      //arrange
      when(
        mockProfileRepo.changePassword({
          "password": oldPass,
          "newPassword": newPass,
        }),
      ).thenAnswer((_) async => Left(failureResponse));
      //act
      final actual = await useCase.call(
        oldPassword: oldPass,
        newPassword: newPass,
      );
      //assert
      expect(actual, equals(Left(failureResponse)));
    });
  });

}
