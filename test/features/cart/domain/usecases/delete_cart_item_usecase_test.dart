import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/cart/data/models/cart_model/cart_response.dart';
import 'package:flowery/features/cart/domain/repos/cart_repo.dart';
import 'package:flowery/features/cart/domain/usecases/delete_cart_item_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'delete_cart_item_usecase_test.mocks.dart';

@GenerateMocks([CartRepo, ])
void main() {
  group('DeleteCartItemUseCase', () {
    late DeleteCartItemUsecase useCase;
    late MockCartRepo repo;
  
    setUp(() {
      repo = MockCartRepo();
      useCase = DeleteCartItemUsecase(repo);
    });
    test(
      'when call invoke in usecase it should call deleteCartItem from repo and when call deleteCartItem from repo i expect to return Right<DeleteCartResponse>',
      () async {
        var result = CartResponse();
        when(
          repo.removeFromCart(productId: '1'),
        ).thenAnswer((_) async => Right(result));
        var actual = await useCase.invoke(cartItemId: '1');
        verify(repo..removeFromCart(productId: '1')).called(1);
        expect(actual, equals(Right(result)));
      },
    );
  test('when call invoke in usecase it should call deleteCartItem from repo and when call deleteCartItem from repo i expect to return Left<Failure>', () async {
    var result = ServerFailure(errorMessage: "error");
    when(
      repo.removeFromCart(productId: "1"),
    ).thenAnswer((_) async => Left(result));
    var actual = await useCase.invoke(cartItemId: "1");
    verify(repo.removeFromCart(productId: "1")).called(1);
    expect(actual, equals(Left(result)));
  });
  
  });
}
