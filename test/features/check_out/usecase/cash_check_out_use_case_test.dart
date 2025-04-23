import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/check_out/data/models/cash_order_response.dart';
import 'package:flowery/features/check_out/data/models/shipping_address_model.dart';
import 'package:flowery/features/check_out/domain/repos/check_out_repo.dart';
import 'package:flowery/features/check_out/domain/use_case/cash_check_out_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'cash_check_out_use_case_test.mocks.dart';

@GenerateMocks([CheckOutRepo])
void main() {
  late CashCheckOutUseCase cashCheckOutUseCase;
  late MockCheckOutRepo mockCheckOutRepo;

  setUp(() {
    mockCheckOutRepo = MockCheckOutRepo();
    cashCheckOutUseCase = CashCheckOutUseCase(mockCheckOutRepo);
  });

  test('should return CashOrderResponse when cashCheckOut is successful', () async {
    // Arrange
    final shippingAddress = ShippingAddressModel(
      street: 'Some Address',
      city: 'Some City',
      long: 'long',
      lat: 'lat',
      phone: 'phone',
    );
    final cashOrderResponse = CashOrderResponse(message: 'Success', order: OrderModel(id: '1'));

    // Mock repository to return a successful response
    when(mockCheckOutRepo.cashCheckOut(any))
        .thenAnswer((_) async => Right(cashOrderResponse));

    // Act
    final result = await cashCheckOutUseCase.call(shippingAddress);

    // Assert
    expect(result, Right(cashOrderResponse));  // Success case
  });

  test('should return ServerFailure when cashCheckOut fails', () async {
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
    when(mockCheckOutRepo.cashCheckOut(any))
        .thenAnswer((_) async => Left(failure));

    // Act
    final result = await cashCheckOutUseCase.call(shippingAddress);

    // Assert
    expect(result, Left(failure));  // Failure case
  });
}
