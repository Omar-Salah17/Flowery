
import 'package:flowery/core/api_manger/api_service.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';
import 'package:flowery/core/utils/models/products_model/products_model.dart';
import 'package:flowery/features/categories/data/data_source/categories_screen_remote_data_source.dart';
import 'package:flowery/features/categories/data/data_source/categories_screen_remote_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../profile/data/data_source/profile_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late MockApiService mockApiService;
  late CategoriesScreenRemoteDataSource categoriesScreenRemoteDataSource;

  setUp(() {
    mockApiService = MockApiService();
    categoriesScreenRemoteDataSource = CategoriesScreenRemoteDataSourceImpl(
      apiService: mockApiService,
    );
  });

  group(
    "this group is testing data source that is responsible for fetching the products with specific filter",
    () {
      test("should fetch products in descending order", () async {
        final List<Product> expectedProducts = [];
        final productsModel = ProductsModel(products: expectedProducts);
        const sort = 'price';

        when(
          mockApiService.getProductsByCategory(categoryId: null, sort: sort),
        ).thenAnswer((_) async => productsModel);

        final actual = await categoriesScreenRemoteDataSource
            .getProductsByCategory(categoryId: null, sort: sort);

        verify(
          mockApiService.getProductsByCategory(categoryId: null, sort: sort),
        ).called(1);

        expect(actual.products, expectedProducts);
      });

      test("should fetch products in ascending order", () async {
        final List<Product> expectedProducts = [];
        final productsModel = ProductsModel(products: expectedProducts);
        const sort = '-price';

        when(
          mockApiService.getProductsByCategory(categoryId: null, sort: sort),
        ).thenAnswer((_) async => productsModel);

        final actual = await categoriesScreenRemoteDataSource
            .getProductsByCategory(categoryId: null, sort: sort);

        verify(
          mockApiService.getProductsByCategory(categoryId: null, sort: sort),
        ).called(1);

        expect(actual.products, expectedProducts);
      });
    },
  );
}
