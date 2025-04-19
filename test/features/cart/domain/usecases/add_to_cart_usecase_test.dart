import 'package:dartz/dartz.dart';
import 'package:flowery/features/cart/data/models/add_product_request.dart';
import 'package:flowery/features/cart/data/models/cart_model/cart_response.dart';
import 'package:flowery/features/cart/domain/repos/cart_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_to_cart_usecase_test.mocks.dart';

@GenerateMocks([CartRepo])
void main() {
  test('when call invoke in usecase it should call addToCart from repo ', () {
    var repo = MockCartRepo();
    final request = AddProductRequest(productId: '1', quantity: 2);
    final response = CartResponse(message: 'Added successfully');

    when(
      repo.addToCart(addProductRequest: request),
    ).thenAnswer((_) async => Right(response));

    // usecase.invoke(addProductRequest: addProductRequest);
  });
}
