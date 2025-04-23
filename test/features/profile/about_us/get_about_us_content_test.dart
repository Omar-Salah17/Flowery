


import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/profile/about_us/data/Models/about_us_model.dart';
import 'package:flowery/features/profile/about_us/domain/repositories/about_us_repo.dart';
import 'package:flowery/features/profile/about_us/domain/use_cases/about_us_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'get_about_us_content_test.mocks.dart';

@GenerateMocks([AboutRepository])
void main() {
  group("Test getting about us Content", () {
    late AboutRepository mockAboutUsScreenRepo;
    late AboutUsUseCase useCase;
    setUp(() {
      mockAboutUsScreenRepo = MockAboutRepository();
      useCase = AboutUsUseCase(mockAboutUsScreenRepo);
    });
    test(
      'When Calling the Use case it should call the  Repository and repository should return on the right the Model of the About us',
          () async {
        //arrange
        final result = AboutUsModel();
        when(
          mockAboutUsScreenRepo.getAboutUsContent(),
        ).thenAnswer((_) async => Right(result));
        //act
        final actual = await useCase.call();
        //assert , verifications . expectation
        verify(mockAboutUsScreenRepo.getAboutUsContent()).called(1);
        expect(actual, equals(Right(result)));
      },
    );
    test(
      'When Calling the Use case it should call the  Repository and repository should return on the left Failure',
          () async {
        //arrange
        final result = ServerFailure(errorMessage: 'Something went wrong');
        when(
          mockAboutUsScreenRepo.getAboutUsContent(),
        ).thenAnswer((_) async => Left(result));
        //act
        final actual = await useCase.call();
        //assert
        verify(mockAboutUsScreenRepo.getAboutUsContent()).called(1);
        expect(actual, equals(Left(result)));
      },
    );
  });
}
