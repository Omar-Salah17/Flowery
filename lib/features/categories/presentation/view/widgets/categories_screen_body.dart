import 'package:flowery/core/utils/helper_functions/snack_bar.dart';
import 'package:flowery/features/categories/presentation/view/widgets/categories_title_list_view.dart';
import 'package:flowery/features/categories/presentation/view/widgets/products_grid_view.dart';
import 'package:flowery/features/categories/presentation/view_model/cubits/categories_cubit/categories_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreenBody extends StatelessWidget {
  const CategoriesScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesScreenCubit, CategoriesScreenState>(
      listener: (context, state) {
        if (state is CategoriesFailure) {
          showErrorSnackBar(context, state.errorMessage);
        }
      },
      builder: (BuildContext context, CategoriesScreenState state) {
        final cat = context.read<CategoriesScreenCubit>().categories;
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    SizedBox(height: 26.h),
                    CategoriesTitleListView(category: cat),
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),
            ProductsGridView(),
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),
          ],
        );
      },
    );
  }
}
