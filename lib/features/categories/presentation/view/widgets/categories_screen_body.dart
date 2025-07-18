import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/helper/spacing.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/models/products_model/product.dart';
import 'package:flowery/core/utils/widgets/custom_error_widget.dart';
import 'package:flowery/core/utils/widgets/products_grid_view.dart';
import 'package:flowery/features/categories/presentation/view_model/cubits/categories_cubit/categories_screen_cubit.dart';
import 'package:flowery/features/home/presentation/widgets/tab_widget.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreenBody extends StatefulWidget {
  const CategoriesScreenBody({super.key, required this.currentCategory});
  final String currentCategory;
  @override
  State<CategoriesScreenBody> createState() => _CategoriesScreenBodyState();
}

class _CategoriesScreenBodyState extends State<CategoriesScreenBody>
    with TickerProviderStateMixin {
  late CategoriesScreenCubit _categoriesCubit;

  @override
  void initState() {
    _categoriesCubit = context.read<CategoriesScreenCubit>();
    _categoriesCubit.getAllCategories().then((_) {
      if (_categoriesCubit.categories.isNotEmpty) {
        initTabController();
        int initialIndex = 0;
        if (widget.currentCategory.isNotEmpty) {
          initialIndex = _categoriesCubit.categories.indexWhere(
            (cat) => cat.name == widget.currentCategory,
          );
          if (initialIndex == -1) initialIndex = 0;
          _categoriesCubit.tabController.index = initialIndex;
        }

        final selectedId = _categoriesCubit.categories[initialIndex].id ?? '';
        _categoriesCubit.getProductsByCategory(categoryId: selectedId);
        _setupCategoriesTabListener();
      }
    });
    super.initState();
  }

  void initTabController() {
    _categoriesCubit.tabController = TabController(
      length: _categoriesCubit.categories.length,
      vsync: this,
    );
  }

  void _setupCategoriesTabListener() {
    _categoriesCubit.tabController.addListener(() {
      if (!_categoriesCubit.tabController.indexIsChanging) {
        final id =
            _categoriesCubit
                .categories[_categoriesCubit.tabController.index]
                .id;
        _categoriesCubit.getProductsByCategory(categoryId: id);
      }
    });
  }

  @override
  void dispose() {
    _categoriesCubit.tabController.dispose();
    _categoriesCubit.tabController.removeListener(() {});

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoryCubit = context.read<CategoriesScreenCubit>();

    return BlocBuilder<CategoriesScreenCubit, CategoriesScreenState>(
      buildWhen:
          (previous, current) =>
              previous != current && current is CategoriesSuccess ||
              current is ProductsByCategorySuccess,
      builder: (context, state) {
        if (state is ProductsByCategorySuccess) {
          return DefaultTabController(
            length: categoryCubit.categories.length,
            initialIndex: categoryCubit.tabController.index,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: TabWidget(
                    controller: categoryCubit.tabController,
                    tabs:
                        categoryCubit.categories
                            .map((cat) => Tab(text: cat.name))
                            .toList(),
                  ),
                ),

                SliverToBoxAdapter(child: verticalSpace(10)),

                state.products.isEmpty
                    ? SliverToBoxAdapter(
                      child: Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: CustomErrorWidget(
                            title: "Ooops",
                            content: LocaleKeys.noProductsInCategory.tr(),
                          ),
                        ),
                      ),
                    )
                    : ProductsGridView(productsList: state.products),
              ],
            ),
          );
        } else if (state is CategoriesFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: PalletsColors.mainColorBase,
            ),
          );
        }
      },
    );
  }
}
