// import 'package:dartz/dartz.dart';
// import 'package:flowery/core/utils/error_handler.dart';
// import 'package:flowery/features/cart/data/models/delete%20item%20models/delete_specific_item_response.dart';
// import 'package:flowery/features/cart/data/models/get%20logged%20cart%20models/get_logged_cart_response.dart';
// import 'package:flowery/features/cart/domain/repos/logged/get_logged_cart_repo.dart';
// import 'package:flowery/features/cart/domain/usecases/get_user_cart_usecase.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import 'delete_cart_item_usecase_test.mocks.dart';
// import 'get_logged_cart_usecase_test.mocks.dart';
// // 
// @GenerateMocks([GetLoggedCartRepo])
// void main() {
//   group('get logged cart Usecase', () {
//     late GetUserCartUsecase usecase;
//     late GetLoggedCartRepo repo;

//     setUp(() {
//       repo = MockGetLoggedCartRepo();
//       usecase = GetUserCartUsecase(repo: repo);
//     });
//     // test(
//     //   'when call invoke in usecase it should call GetLoggedCart from repo and when call GetLoggedCart from repo i expect to return Right<GetLoggedCartResponse>',
//     //   () async {

//     //     when(
//     //       repo.getLoggedCart(),
//     //     ).thenAnswer((_) async => Right(GetLoggedCartResponse()));
//     //     var actual = await usecase.invoke();
//     //     verify(repo.getLoggedCart()).called(1);
//     //     expect(actual, equals(Right(result)));
//     //   },
//     // );
//     test(
//       'when call invoke in usecase it should call deleteCartItem from repo and when call deleteCartItem from repo i expect to return Left<Failure>',
//       () async {
//         var result = ServerFailure(errorMessage: "error");
//         when(repo.getLoggedCart()).thenAnswer((_) async => Left(result));
//         var actual = await usecase.invoke();
//         verify(repo.getLoggedCart()).called(1);
//         expect(actual, equals(Left(result)));
//       },
//     );
//   });
// }
