import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/address/data/models/logged_user_address_model.dart';
import 'package:flowery/features/address/domain/repos/repos/Address_repository_contract.dart';
import 'package:flowery/features/address/domain/use_case/get_logged_user_address_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_logged_user_address_use_case_test.mocks.dart';

@GenerateMocks([AddressRepositoryContract])
void main() {
  group('GetLoggedUserAddressUseCase', () {
    late MockAddressRepositoryContract repo;
    late GetLoggedUserAddressUseCase useCase;
    setUp(() {
      repo = MockAddressRepositoryContract();
      useCase = GetLoggedUserAddressUseCase(repo);
    });
    test(
      'when call invoke in usecase it should call getLoggedUserAddress from repo then return right List<Addresses>',
      () async {
        // Arrange

        final expectedResult = <Addresses>[];
        when(
          repo.getLoggedUserAddress(),
        ).thenAnswer((_) async => Right(expectedResult));
        // Act
        final result = await useCase.invoke();
        // Assert
        verify(repo.getLoggedUserAddress()).called(1);
        expect(result, Right(expectedResult));
      },
    );
    test(
      'when call invoke in usecase it should call getLoggedUserAddress from repo then return left Failure',
      () async {
        // Arrange
        final expectedResult = ServerFailure(errorMessage: 'error');
        when(
          repo.getLoggedUserAddress(),
        ).thenAnswer((_) async => Left(expectedResult));
        // Act
        final result = await useCase.invoke();
        // Assert
        verify(repo.getLoggedUserAddress()).called(1);
        expect(result, Left(expectedResult));
      },
    );
  });
}
