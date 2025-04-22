


import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/profile/terms_and_conditions/data/Models/terms_and_conditions_model.dart';
import 'package:flowery/features/profile/terms_and_conditions/domain/repositories/terms_and_conditions_repo.dart';
import 'package:flowery/features/profile/terms_and_conditions/domain/use_cases/terms_and_conditions_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'get_terms_and_conditions_content_test.mocks.dart';


@GenerateMocks([TermsAndConditionsRepo])
void main() {
  group("Test getting terms and condition test", () {
    late TermsAndConditionsRepo mockTermsAndConditionsRepo;
    late TermsAndConditionsUseCase useCase;
    setUp(() {
      mockTermsAndConditionsRepo = MockTermsAndConditionsRepo();
      useCase = TermsAndConditionsUseCase(mockTermsAndConditionsRepo);
    });
    test(
      'When Calling the Use case it should call the  Repository and repository should return on the right the Model of the Terms And Conditions',
          () async {
        //arrange
        final result = TermsAndConditionsModel();
        when(
          mockTermsAndConditionsRepo.getTermsAndConditions(),
        ).thenAnswer((_) async => Right(result));
        //act
        final actual = await useCase.call();
        //assert , verifications . expectation
        verify(mockTermsAndConditionsRepo.getTermsAndConditions()).called(1);
        expect(actual, equals(Right(result)));
      },
    );
    test(
      'When Calling the Use case it should call the  Repository and repository should return on the left Failure',
          () async {
        //arrange
        final result = ServerFailure(errorMessage: 'Something went wrong');
        when(
          mockTermsAndConditionsRepo.getTermsAndConditions(),
        ).thenAnswer((_) async => Left(result));
        //act
        final actual = await useCase.call();
        //assert
        verify(mockTermsAndConditionsRepo.getTermsAndConditions()).called(1);
        expect(actual, equals(Left(result)));
      },
    );
  });
}
