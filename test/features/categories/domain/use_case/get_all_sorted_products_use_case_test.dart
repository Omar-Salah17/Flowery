import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';
import 'package:flowery/features/categories/domain/repos/categories_screen_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flowery/features/categories/domain/use_case/get_all_sorted_products_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_all_categories_use_case_test.mocks.dart';

@GenerateMocks([CategoriesScreenRepo])
void main() {
  group("Test GetProductsByCategoryWithSortUseCase", () {
    late CategoriesScreenRepo mockRepo;
    late GetProductsByCategoryWithSortUseCase useCase;

    setUp(() {
      mockRepo = MockCategoriesScreenRepo();
      useCase = GetProductsByCategoryWithSortUseCase(repo: mockRepo);
    });

    test(
      "Should return product list when using descending order (-price)",
      () async {
        final List<Product> expectedProducts = [];
        const sort = '-price';

        when(
          mockRepo.getProductsByCategory(categoryId: null, sort: sort),
        ).thenAnswer((_) async => Right(expectedProducts));

        final actual = await useCase.call(sort: sort);

        verify(
          mockRepo.getProductsByCategory(categoryId: null, sort: sort),
        ).called(1);
        expect(actual, equals(Right(expectedProducts)));
      },
    );
    test(
      "should retrun product list when using ascending order (price)",
      () async {
        final List<Product> expectedProducts = [];
        const sort = 'price';

        when(
          mockRepo.getProductsByCategory(categoryId: null, sort: sort),
        ).thenAnswer((_) async => Right(expectedProducts));

        final actual = await useCase.call(sort: sort);
        verify(
          mockRepo.getProductsByCategory(categoryId: null, sort: sort).call(1),
        );
        expect(actual, equals(Right(expectedProducts)));
      },
    );
  });
}
