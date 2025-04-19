import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/cart/domain/repos/cart_repo.dart';
import 'package:flowery/features/cart/domain/usecases/get_user_cart_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'delete_cart_item_useCase_test.mocks.dart';


@GenerateMocks([CartRepo])
void main() {
  group('get logged cart UseCase', () {
    late GetUserCartUsecase useCase;
    late CartRepo repo;

    setUp(() {
      repo = MockCartRepo();
      useCase = GetUserCartUsecase(repo);
    });
    // test(
    //   'when call invoke in useCase it should call GetLoggedCart from repo and when call GetLoggedCart from repo i expect to return Right<GetLoggedCartResponse>',
    //   () async {

    //     when(
    //       repo.getLoggedCart(),
    //     ).thenAnswer((_) async => Right(GetLoggedCartResponse()));
    //     var actual = await useCase.invoke();
    //     verify(repo.getLoggedCart()).called(1);
    //     expect(actual, equals(Right(result)));
    //   },
    // );
    test(
      'when call invoke in useCase it should call deleteCartItem from repo and when call deleteCartItem from repo i expect to return Left<Failure>',
      () async {
        var result = ServerFailure(errorMessage: "error");
        when(repo.getUserCart()).thenAnswer((_) async => Left(result));
        var actual = await useCase.invoke();
        verify(repo.getUserCart()).called(1);
        expect(actual, equals(Left(result)));
      },
    );
  });
}
