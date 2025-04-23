import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';
import 'package:flowery/core/utils/models/products_model/products_model.dart';
import 'package:flowery/features/categories/data/data_source/categories_screen_remote_data_source.dart';
import 'package:flowery/features/categories/data/repos/categories_screen_repo_impl.dart';
import 'package:flowery/features/categories/domain/repos/categories_screen_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'categories_screen_repo_impl_test.mocks.dart';

@GenerateMocks([CategoriesScreenRemoteDataSource])
void main() {
  late MockCategoriesScreenRemoteDataSource
  mockCategoriesScreenRemoteDataSource;
  late CategoriesScreenRepo repo;

  setUp(() {
    mockCategoriesScreenRemoteDataSource =
        MockCategoriesScreenRemoteDataSource();
    repo = CategoriesScreenRepoImpl(
      categoriesRemoteDataSource: mockCategoriesScreenRemoteDataSource,
    );
  });

  group("Repo tests for fetching products by category with sorting", () {
    test("should fetch products with descending order", () async {
      final List<Product> expectedProducts = [];
      final productsModel = ProductsModel(products: expectedProducts);
      const sort = 'price';

      when(
        mockCategoriesScreenRemoteDataSource.getProductsByCategory(
          categoryId: null,
          sort: sort,
        ),
      ).thenAnswer((_) async => productsModel);

      final actual = await repo.getProductsByCategory(
        categoryId: null,
        sort: sort,
      );

      // Assert
      verify(
        mockCategoriesScreenRemoteDataSource.getProductsByCategory(
          categoryId: null,
          sort: sort,
        ),
      ).called(1);
      expect(actual, Right(expectedProducts));
    });

    test("should fetch products with ascending order", () async {
      final List<Product> expectedProducts = [];
      final productsModel = ProductsModel(products: expectedProducts);
      const sort = '-price';

      when(
        mockCategoriesScreenRemoteDataSource.getProductsByCategory(
          categoryId: null,
          sort: sort,
        ),
      ).thenAnswer((_) async => productsModel);

      final actual = await repo.getProductsByCategory(
        categoryId: null,
        sort: sort,
      );

      verify(
        mockCategoriesScreenRemoteDataSource.getProductsByCategory(
          categoryId: null,
          sort: sort,
        ),
      ).called(1);
      expect(actual, Right(expectedProducts));
    });
  });
}
