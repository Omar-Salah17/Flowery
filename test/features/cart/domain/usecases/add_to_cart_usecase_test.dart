import 'package:dartz/dartz.dart';
import 'package:flowery/features/cart/data/models/add_product_request.dart';
import 'package:flowery/features/cart/data/models/add_product_response.dart';
import 'package:flowery/features/cart/domain/repos/add_to_cart_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flowery/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_to_cart_usecase_test.mocks.dart';

@GenerateMocks([AddToCartRepo])
void main() {
  test('when call invoke in usecase it should call addToCart from repo ', () {
    var repo = MockAddToCartRepo();
    AddToCartUsecase usecase = AddToCartUsecase(addToCartRepo: repo);
    final request = AddProductRequest(product: '1', quantity: 2);
    final response = AddProductResponse(message: 'Added successfully');

    when(
      repo.addToCart(addProductRequest: request),
    ).thenAnswer((_) async => Right(response));

    // usecase.invoke(addProductRequest: addProductRequest);
  });
}
