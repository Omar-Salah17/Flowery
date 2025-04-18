import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/categories/data/models/categories_model/category.dart';
import 'package:flowery/features/categories/presentation/view/widgets/categories_title_widget.dart';
import 'package:flowery/features/categories/presentation/view_model/cubits/categories_cubit/categories_screen_cubit.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesTitleListView extends StatefulWidget {
  const CategoriesTitleListView({super.key, required this.category});
  final List<Category> category;

  @override
  State<CategoriesTitleListView> createState() =>
      _CategoriesTitleListViewState();
}

class _CategoriesTitleListViewState extends State<CategoriesTitleListView> {
  // String selectedCategoryId = "all";
  @override
  Widget build(BuildContext context) {
    String selectedCat =
        context.read<CategoriesScreenCubit>().selectedCategoryId;

    return SizedBox(
      height: 40.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                selectedCat;
                context.read<CategoriesScreenCubit>().getProductsByCategory();
              },
              child: Column(
                children: [
                  Text(
                   LocaleKeys.all.tr(),
                    style: AppTextStyles.instance.textStyle16.copyWith(
                      color:
                          selectedCat == LocaleKeys.all.tr()
                              ? PalletsColors.mainColorBase
                              : PalletsColors.white70,
                    ),
                  ),
                  Container(
                    height: 3.h,
                    width: 15.w,
                    decoration: BoxDecoration(
                      color:
                          selectedCat == LocaleKeys.all.tr()
                              ? PalletsColors.mainColorBase
                              : PalletsColors.white70,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100.r),
                        topRight: Radius.circular(100.r),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ...widget.category.map(
              (cat) => GestureDetector(
                onTap: () {
                  selectedCat = cat.id!;

                  context.read<CategoriesScreenCubit>().getProductsByCategory(
                    categoryId: cat.id,
                  );
                },
                child: CategoriesTitleWidget(
                  category: cat,
                  isSelected: selectedCat == cat.id,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
