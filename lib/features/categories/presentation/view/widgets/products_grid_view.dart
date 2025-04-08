import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/helper_functions/snack_bar.dart';

import 'package:flowery/features/categories/presentation/view/widgets/product_item_widget.dart';
import 'package:flowery/features/categories/presentation/view_model/cubits/categories_cubit/categories_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

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
                  "There is no products now in this category 😔 ",
                  style: AppTextStyles.instance.textStyle16.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          } else {
            return SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      ProductItemWidget(product: state.products[index]),

                  childCount: state.products.length,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 17.h,
                  crossAxisSpacing: 17.w,
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                ),
              ),
            );
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
