// import 'package:dartz/dartz.dart';
// import 'package:flowery/core/utils/error_handler.dart';
// import 'package:flowery/features/cart/data/models/delete%20item%20models/delete_specific_item_response.dart';
// import 'package:flowery/features/cart/domain/repos/delete%20item/delete_cart_item_repo.dart';
// import 'package:flowery/features/cart/domain/usecases/delete_cart_item_usecase.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import 'delete_cart_item_usecase_test.mocks.dart';

// @GenerateMocks([DeleteCartItemRepo, ])
// void main() {
//   group('DeleteCartItemUsecase', () {
//     late DeleteCartItemUsecase usecase;
//     late MockDeleteCartItemRepo repo;
  
//     setUp(() {
//       repo = MockDeleteCartItemRepo();
//       usecase = DeleteCartItemUsecase(repo: repo);
//     });
//     test(
//       'when call invoke in usecase it should call deleteCartItem from repo and when call deleteCartItem from repo i expect to return Right<DeleteCartResponse>',
//       () async {
//         var result = DeleteCartResponse();
//         when(
//           repo.deleteCartItem(cartItemId: '1'),
//         ).thenAnswer((_) async => Right(result));
//         var actual = await usecase.invoke(cartItemId: '1');
//         verify(repo.deleteCartItem(cartItemId: "1")).called(1);
//         expect(actual, equals(Right(result)));
//       },
//     );
//   test('when call invoke in usecase it should call deleteCartItem from repo and when call deleteCartItem from repo i expect to return Left<Failure>', () async {
//     var result = ServerFailure(errorMessage: "error");
//     when(
//       repo.deleteCartItem(cartItemId: "1"),
//     ).thenAnswer((_) async => Left(result));
//     var actual = await usecase.invoke(cartItemId: "1");
//     verify(repo.deleteCartItem(cartItemId: "1")).called(1);
//     expect(actual, equals(Left(result)));
//   });
  
//   });
// }
