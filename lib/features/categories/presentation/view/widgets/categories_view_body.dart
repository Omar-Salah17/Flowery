import 'package:flowery/features/categories/presentation/view/widgets/categories_title_list_view.dart';
import 'package:flowery/features/categories/presentation/view/widgets/products_grid_view.dart';
import 'package:flowery/features/categories/presentation/view_model/cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccess) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      SizedBox(height: 26.h),
                      CategoriesTitleListView(category: state.categories,),
                      SizedBox(height: 32.h),
                    ],
                  ),
                ),
              ),
              ProductsGridView(),
              SliverToBoxAdapter(child: SizedBox(height: 10.h)),
            ],
          );
        } else if (state is CategoriesFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
