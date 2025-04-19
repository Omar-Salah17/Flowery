import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/categories/domain/use_case/get_all_categories_use_case.dart';
import 'package:flowery/features/categories/domain/use_case/get_products_by_category_use_case.dart';
import 'package:flowery/features/categories/presentation/view/widgets/categories_screen_body.dart';
import 'package:flowery/features/categories/presentation/view/widgets/categories_view_app_bar.dart';
import 'package:flowery/features/categories/presentation/view_model/cubits/categories_cubit/categories_screen_cubit.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              CategoriesScreenCubit(
                  getIt.get<GetAllCategoriesUseCase>(),
                  getIt.get<GetProductsByCategoryUseCase>(),
                )
                ..getAllCategories()
                ..getProductsByCategory(),

      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: const SafeArea(child: CategoriesScreenAppBar()),
        ),
        body: const CategoriesScreenBody(),
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
                 LocaleKeys.filter.tr(),
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
