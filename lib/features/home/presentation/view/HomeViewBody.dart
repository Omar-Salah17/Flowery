import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/features/home/presentation/viewModel/HomeCategoriesStates.dart';
import 'package:flowery/features/home/presentation/viewModel/HomeCategoriesViewModel.dart';
import 'package:flowery/features/home/presentation/widgets/home_best_seller.dart';
import 'package:flowery/features/home/presentation/widgets/home_occasions_view.dart';
import 'package:flowery/features/home/presentation/widgets/view_all_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/colors.dart';
import 'SearchBar.dart';
import 'currentUserLocation.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset("assets/images/Flower.svg"),
            Text(
              "Flowery",
              style: AppTextStyles.instance.textStyle20Fell.copyWith(
                color: PalletsColors.mainColorBase,
              ),
            ),
            Spacer(),

            Expanded(flex: 10, child: CustomSearchBar()),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CurrentUserLocation(),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16).r,
                  child: Text(
                    "Categories",
                    style: AppTextStyles.instance.textStyle18,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 16).r,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.categories);
                    },
                    child: Text(
                      "View All",
                      style: AppTextStyles.instance.textStyle12.copyWith(
                        color: PalletsColors.mainColorBase,
                        decoration: TextDecoration.underline,
                        decorationColor: PalletsColors.mainColorBase,
                        decorationThickness:
                            2, // Optional: Set thickness of the underline
                      ),
                    ),
                  ),
                ),
              ],
            ),
            BlocBuilder<HomeCategoriesViewModel, CategoriesState>(
              builder: (context, state) {
                if (state is CategoriesFailureState) {
                  return Text(state.message);
                } else if (state is CategoriesSuccessState) {
                  final categories = state.categoriesResponse.categories;
                  print("Categories count is ${categories?.length}");
                  return SizedBox(
                    height: 120.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories?.length ?? 0,
                      itemBuilder: (context, index) {
                        final category = categories![index];
                        return Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ).r,
                              child: Container(
                                padding: EdgeInsets.all(20).r,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: PalletsColors.mainColor10,
                                ),
                                child: Image.network(
                                  category.image ?? "No Image Found",
                                  width: 18.17.w,
                                  height: 22.5.h,
                                ),
                              ),
                            ),
                            Text(
                              (category.name != null &&
                                      category.name!.isNotEmpty)
                                  ? category.name![0].toUpperCase() +
                                      category.name!.substring(1)
                                  : "No name found",
                            ),
                          ],
                        );
                      },
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),

            ViewAllWidget(title: "Best seller", onTap: () {}),

            SizedBox(height: 16.h),

            HomeBestSeller(),

            SizedBox(height: 12.h),

            ViewAllWidget(title: "Occasion", onTap: () {}),

            SizedBox(height: 16.h),

            HomeOccasionsView(),
          ],
        ),
      ),
    );
  }
}
