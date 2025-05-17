import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/widgets/products_grid_view.dart';
import 'package:flowery/features/categories/domain/use_case/get_all_categories_use_case.dart';
import 'package:flowery/features/categories/domain/use_case/get_products_by_category_use_case.dart';
import 'package:flowery/features/categories/domain/use_case/search_use_case.dart';
import 'package:flowery/features/categories/presentation/view_model/cubits/categories_cubit/categories_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/get_all_sorted_products_use_case.dart';

class ProductSearchDelegate extends SearchDelegate {
  final CategoriesScreenCubit cubit = CategoriesScreenCubit(
    getIt.get<GetAllCategoriesUseCase>(),
    getIt.get<GetProductsByCategoryUseCase>(),
    getIt.get<GetProductsByCategoryWithSortUseCase>(),
    getIt.get<SearchUseCase>(),
  );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    cubit.search(keyword: query);
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<CategoriesScreenCubit, CategoriesScreenState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductsByCategorySuccess) {
            if (state.products.isEmpty) {
              return const Center(child: Text('No results found'));
            }
            return CustomScrollView(
              slivers: [ProductsGridView(productsList: state.products)],
            );
          } else if (state is ProductsByCategoryFailure) {
            return Center(child: Text(state.errorMessage));
          } else {
            return const Center(child: Text('Start typing to search...'));
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text('Search For Any Product You Want'));
  }
}
