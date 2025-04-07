import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/categories/data/models/categories_model/category.dart';
import 'package:flowery/features/categories/presentation/view/widgets/categories_title_widget.dart';
import 'package:flowery/features/categories/presentation/view_model/cubits/categories_cubit/categories_screen_cubit.dart';
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
                setState(() {});

                context.read<CategoriesScreenCubit>().getCategoriesScreenData();
              },
              child: Column(
                children: [
                  Text(
                    'All',
                    style: AppTextStyles.instance.textStyle16.copyWith(
                      color:
                          selectedCat == "all"
                              ? PalletsColors.mainColorBase
                              : PalletsColors.white70,
                    ),
                  ),
                  Container(
                    height: 3.h,
                    width: 15.w,
                    decoration: BoxDecoration(
                      color:
                          selectedCat == "all"
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
                onTap: () async {
                  selectedCat = cat.id!;
                  setState(() {});

                  await context
                      .read<CategoriesScreenCubit>()
                      .getCategoriesScreenData(categoryId: cat.id);
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
