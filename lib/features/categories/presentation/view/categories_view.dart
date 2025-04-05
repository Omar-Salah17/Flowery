import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/categories/domain/use_case/get_all_categories_use_case.dart';
import 'package:flowery/features/categories/presentation/view/widgets/categories_view_app_bar.dart';
import 'package:flowery/features/categories/presentation/view/widgets/categories_view_body.dart';
import 'package:flowery/features/categories/presentation/view_model/cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => CategoriesCubit(getIt.get<GetAllCategoriesUseCase>())..getCategoriesData(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: SafeArea(child: CategoriesViewAppBar()),
        ),
        body: CategoriesViewBody(),
        floatingActionButton: FloatingActionButton.extended(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          backgroundColor: PalletsColors.mainColorBase,
          onPressed: () {},
          label: SizedBox(
            width: 101.w,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.tune, size: 20.r, color: PalletsColors.whiteBase),
                SizedBox(width: 12.w),
                Text(
                  "Filter",
                  style: AppTextStyles.instance.textStyle14.copyWith(
                    color: PalletsColors.whiteBase,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
