import 'package:flowery/core/api_manger/api_service.dart';
import 'package:flowery/features/check_out/data/data_source/check_out_remote_data_source.dart';
import 'package:flowery/features/check_out/data/data_source/check_out_remote_data_source_impl.dart';
import 'package:flowery/features/check_out/data/models/cash_order_response.dart';
import 'package:flowery/features/check_out/data/models/check_out_session_response.dart'
    show CheckoutSession, CheckoutSessionResponse;
import 'package:flowery/features/check_out/data/models/shipping_address_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'check_out_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  group('Test CheckOutRemoteDataSource', () {
    late ApiService mockApiService;
    late CheckOutRemoteDataSource dataSource;
    final shippingAddress = ShippingAddressModel(
      street: '123 Main St',
      city: 'Cairo',
      phone: '',
      lat: '',
      long: '',
    );

    setUp(() {
      mockApiService = MockApiService();
      dataSource = CheckOutRemoteDataSourceImpl(mockApiService);
    });

    test('should call cashCheckOut and return CashOrderResponse', () async {
      final mockResponse = CashOrderResponse(
        message: 'success',
        order: OrderModel(id: '123'),
      );

      when(
        mockApiService.cashCheckOut(shippingAddress),
      ).thenAnswer((_) async => mockResponse);

      final result = await dataSource.cashCheckOut(shippingAddress);

      expect(result, mockResponse);
      verify(mockApiService.cashCheckOut(shippingAddress)).called(1);
    });

    test(
      'should call creditCheckOut and return CheckoutSessionResponse',
      () async {
        final mockResponse = CheckoutSessionResponse(
          CheckoutSession(id: '123'),
          'success',
        );

        when(
          mockApiService.creditCheckOut(
            shippingAddress,
            'http://localhost:3000',
          ),
        ).thenAnswer((_) async => mockResponse);

        final result = await dataSource.creditCheckOut(shippingAddress);

        expect(result, mockResponse);
        verify(
          mockApiService.creditCheckOut(
            shippingAddress,
            'http://localhost:3000',
          ),
        ).called(1);
      },
    );
  });
}
