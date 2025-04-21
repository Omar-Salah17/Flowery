import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/features/check_out/data/data_source/check_out_remote_data_source.dart';
import 'package:flowery/features/check_out/data/models/cash_order_response.dart';
import 'package:flowery/features/check_out/data/models/check_out_session_response.dart';
import 'package:flowery/features/check_out/data/models/shipping_address_model.dart';
import 'package:flowery/features/check_out/data/repos/check_out_repo_impl.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'check_out_repo_impl_test.mocks.dart';

@GenerateMocks([CheckOutRemoteDataSource])
void main() {
  late CheckOutRepoImpl checkOutRepoImpl;
  late MockCheckOutRemoteDataSource mockCheckOutRemoteDataSource;

  setUp(() {
    mockCheckOutRemoteDataSource = MockCheckOutRemoteDataSource();
    checkOutRepoImpl = CheckOutRepoImpl(mockCheckOutRemoteDataSource);
  });

  test('should return CashOrderResponse when cashCheckOut is successful', () async {
    // Arrange
    final cashOrderResponse = CashOrderResponse(message: 'Success', order: OrderModel(id: '1'));
    when(mockCheckOutRemoteDataSource.cashCheckOut(any))
        .thenAnswer((_) async => cashOrderResponse);

    // Act
    final result = await checkOutRepoImpl.cashCheckOut(
        ShippingAddressModel(street: 'Some Address', city: 'Some City', long: 'long', lat: 'lat', phone: 'phone')
    );

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
        phone: 'phone'
    );

    // Mock a DioException or any other exception
    when(mockCheckOutRemoteDataSource.cashCheckOut(any))
        .thenThrow(DioException(requestOptions: RequestOptions(path: '/test')));

    // Act
    final result = await checkOutRepoImpl.cashCheckOut(shippingAddress);

    // Assert
    expect(result.isLeft(), true);  // Check if it's a failure
    result.fold(
          (failure) {
        // Verify that the failure is of type ServerFailure
        expect(failure, isA<ServerFailure>());
      },
          (_) {},
    );
  });

  test('should return CheckoutSessionResponse when creditCheckOut is successful', () async {
    // Arrange
    final checkoutSessionResponse = CheckoutSessionResponse(CheckoutSession(id: '123'), 'Success');
    when(mockCheckOutRemoteDataSource.creditCheckOut(any))
        .thenAnswer((_) async => checkoutSessionResponse);

    // Act
    final result = await checkOutRepoImpl.creditCheckOut(
        ShippingAddressModel(street: 'Some Address', city: 'Some City', long: 'long', lat: 'lat', phone: 'phone')
    );

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
        phone: 'phone'
    );

    // Mock a DioException or any other exception
    when(mockCheckOutRemoteDataSource.creditCheckOut(any))
        .thenThrow(DioException(requestOptions: RequestOptions(path: '/test')));

    // Act
    final result = await checkOutRepoImpl.creditCheckOut(shippingAddress);

    // Assert
    expect(result.isLeft(), true);  // Check if it's a failure
    result.fold(
          (failure) {
        // Verify that the failure is of type ServerFailure
        expect(failure, isA<ServerFailure>());
      },
          (_) {},
    );
  });
}

