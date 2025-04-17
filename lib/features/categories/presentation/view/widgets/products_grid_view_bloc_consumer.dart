import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/helper_functions/snack_bar.dart';
import 'package:flowery/core/utils/widgets/products_grid_view.dart';
import 'package:flowery/features/categories/presentation/view_model/cubits/categories_cubit/categories_screen_cubit.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsGridViewBlocConsumer extends StatelessWidget {
  const ProductsGridViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesScreenCubit, CategoriesScreenState>(
      listener: (BuildContext context, CategoriesScreenState state) {
        if (state is ProductsByCategoryFailure) {
          showErrorSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is ProductsByCategorySuccess) {
          if (state.products.isEmpty) {
            return SliverFillRemaining(
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                 LocaleKeys.noProductsInCategory.tr(),
                  style: AppTextStyles.instance.textStyle16.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          } else {
            return ProductsGridView(productsList: state.products);
          }
        } else {
          return SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(
                color: PalletsColors.mainColorBase,
              ),
            ),
          );
        }
      },
    );
  }
}
