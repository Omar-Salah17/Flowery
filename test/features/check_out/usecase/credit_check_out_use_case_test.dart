import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/check_out/data/models/check_out_session_response.dart';
import 'package:flowery/features/check_out/data/models/shipping_address_model.dart';
import 'package:flowery/features/check_out/domain/repos/check_out_repo.dart';
import 'package:flowery/features/check_out/domain/use_case/credit_check_out_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'credit_check_out_use_case_test.mocks.dart';

@GenerateMocks([CheckOutRepo])
void main() {
  late CreditCheckOutUseCase creditCheckOutUseCase;
  late MockCheckOutRepo mockCheckOutRepo;

  setUp(() {
    mockCheckOutRepo = MockCheckOutRepo();
    creditCheckOutUseCase = CreditCheckOutUseCase(mockCheckOutRepo);
  });

  test('should return CheckoutSessionResponse when creditCheckOut is successful', () async {
    // Arrange
    final shippingAddress = ShippingAddressModel(
      street: 'Some Address',
      city: 'Some City',
      long: 'long',
      lat: 'lat',
      phone: 'phone',
    );
    final checkoutSessionResponse = CheckoutSessionResponse( CheckoutSession(id:'12345'), 'Success');

    // Mock repository to return a successful response
    when(mockCheckOutRepo.creditCheckOut(any))
        .thenAnswer((_) async => Right(checkoutSessionResponse));

    // Act
    final result = await creditCheckOutUseCase.call(shippingAddress);

    // Assert
    expect(result, Right(checkoutSessionResponse));  // Success case
  });

  test('should return ServerFailure when creditCheckOut fails', () async {
    // Arrange
    final shippingAddress = ShippingAddressModel(
      street: 'Some Address',
      city: 'Some City',
      long: 'long',
      lat: 'lat',
      phone: 'phone',
    );
    final failure = ServerFailure(errorMessage: 'Something went wrong');

    // Mock repository to return a failure
    when(mockCheckOutRepo.creditCheckOut(any))
        .thenAnswer((_) async => Left(failure));

    // Act
    final result = await creditCheckOutUseCase.call(shippingAddress);

    // Assert
    expect(result, Left(failure));  // Failure case
  });
}
