import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/categories/data/models/categories_model/category.dart';
import 'package:flowery/features/categories/domain/repos/categories_screen_repo.dart';
import 'package:flowery/features/categories/domain/use_case/get_all_categories_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_all_categories_use_case_test.mocks.dart';

@GenerateMocks([CategoriesScreenRepo])
void main() {
  group("Test GetAllCategoriesUseCase", () {
    late CategoriesScreenRepo mockCategoriesScreenRepo;
    late GetAllCategoriesUseCase useCase;
    setUp(() {
      mockCategoriesScreenRepo = MockCategoriesScreenRepo();
      useCase = GetAllCategoriesUseCase(
        categoriesScreenRepo: mockCategoriesScreenRepo,
      );
    });
    test(
      'When trigger call method from GetAllCategoriesUseCase it should call getAllCategories from categoriesScreenRepo and when call getAllCategories from categoriesScreenRepo i expect to return Right<List<Category>>',
      () async {
        //arragne
       
        var result = <Category>[];
        when(
          mockCategoriesScreenRepo.getAllCategories(),
        ).thenAnswer((_) async => Right(result));
        //act
        var actual = await useCase.call();
        //here im checking if the getAllCategories from categoriesScreenRepo was called for one time
        //assert , verifications . expectation
        verify(mockCategoriesScreenRepo.getAllCategories()).called(1);
        expect(actual, equals(Right(result)));
      },
    );
    test(
      "When trigger call method from GetAllCategoriesUseCase it should call getAllCategories from categoriesScreenRepo and when call getAllCategories from categoriesScreenRepo i expect to return Left<Failure>",
      () async {
        //arragne
        var result = ServerFailure(errorMessage: 'connection time out');
        when(
          mockCategoriesScreenRepo.getAllCategories(),
        ).thenAnswer((_) async => Left(result));
        //act
        var actual = await useCase.call();
        //assert
        verify(mockCategoriesScreenRepo.getAllCategories()).called(1);
        expect(actual, equals(Left(result)));
      },
    );
  });
}
