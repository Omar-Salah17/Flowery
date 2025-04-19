import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/categories/domain/use_case/get_all_categories_use_case.dart';
import 'package:flowery/features/categories/domain/use_case/get_products_by_category_use_case.dart';
import 'package:flowery/features/categories/presentation/view/widgets/categories_view_app_bar.dart';
import 'package:flowery/features/categories/presentation/view/widgets/categories_screen_body.dart';
import 'package:flowery/features/categories/presentation/view_model/cubits/categories_cubit/categories_screen_cubit.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum PriceSortOptions { lowest, highest }

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  PriceSortOptions selectedOption = PriceSortOptions.lowest;
  double sliderValue = 0;

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
          child: SafeArea(child: CategoriesScreenAppBar()),
        ),
        body: CategoriesScreenBody(),
        floatingActionButton: FloatingActionButton.extended(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          backgroundColor: PalletsColors.mainColorBase,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
              ),
              builder: (context) {
                double localSliderValue = sliderValue;
                return StatefulBuilder(
                  builder: (context, setStateBottomSheet) {
                    return Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          topRight: Radius.circular(16.r),
                        ),
                        color: const Color.fromRGBO(249, 249, 249, 1),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 20.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sort by",
                              style: AppTextStyles.instance.textStyle20
                                  .copyWith(
                                    color: PalletsColors.mainColor60,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            SizedBox(height: 16.h),
                            Container(
                              width: double.infinity,
                              height: 50.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Lowest Price",
                                      style: AppTextStyles.instance.textStyle16,
                                    ),
                                    RadioTheme(
                                      data: RadioThemeData(
                                        fillColor:
                                            MaterialStateProperty.resolveWith<
                                              Color
                                            >((states) {
                                              if (states.contains(
                                                MaterialState.selected,
                                              )) {
                                                return PalletsColors
                                                    .mainColorBase;
                                              }
                                              return PalletsColors
                                                  .mainColorBase; // border color when not selected
                                            }),
                                      ),

                                      child: Radio<PriceSortOptions>(
                                        value: PriceSortOptions.lowest,
                                        groupValue: selectedOption,
                                        onChanged: (value) {
                                          if (value != null) {
                                            setState(() {
                                              selectedOption = value;
                                            });
                                            setStateBottomSheet(() {});
                                          }
                                        },
                                        activeColor:
                                            PalletsColors.mainColorBase,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Container(
                              width: double.infinity,
                              height: 50.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Highest Price",
                                      style: AppTextStyles.instance.textStyle16,
                                    ),
                                    RadioTheme(
                                      data: RadioThemeData(
                                        fillColor:
                                            MaterialStateProperty.resolveWith<
                                              Color
                                            >((states) {
                                              if (states.contains(
                                                MaterialState.selected,
                                              )) {
                                                return PalletsColors
                                                    .mainColorBase;
                                              }
                                              return PalletsColors
                                                  .mainColorBase; // border color when not selected
                                            }),
                                      ),
                                      child: Radio<PriceSortOptions>(
                                        value: PriceSortOptions.highest,
                                        groupValue: selectedOption,
                                        onChanged: (value) {
                                          if (value != null) {
                                            setState(() {
                                              selectedOption = value;
                                            });
                                            setStateBottomSheet(() {});
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 16.h),

                            Text(
                              "Price",
                              style: AppTextStyles.instance.textStyle16
                                  .copyWith(color: PalletsColors.mainColor60),
                            ),
                            SizedBox(height: 18.h),
                            SliderContainer(),

                            SizedBox(height: 16.h),
                            Container(
                              width: double.infinity,
                              height: 50.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32.r),
                                color: PalletsColors.mainColorBase,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.tune,
                                    size: 20.sp,
                                    color: PalletsColors.whiteBase,
                                  ),
                                  SizedBox(width: 12.w),
                                  Text(
                                    LocaleKeys.filter.tr(),
                                    style: AppTextStyles.instance.textStyle16
                                        .copyWith(
                                          color: PalletsColors.whiteBase,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
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

class SliderContainer extends StatefulWidget {
  const SliderContainer({super.key});

  @override
  State<SliderContainer> createState() => _SliderContainerState();
}

class _SliderContainerState extends State<SliderContainer> {
  double minValue = 0;
  double maxValue = 1000;
  RangeValues values = const RangeValues(200, 800);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double startPosition =
            (values.start - minValue) / (maxValue - minValue) * 274.0;
        final double endPosition =
            (values.end - minValue) / (maxValue - minValue) * 314.0;

        log(startPosition.toString());
        log(endPosition.toString());

        return Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                RangeSlider(
                  min: minValue,
                  max: maxValue,
                  divisions: 1000,
                  values: values,
                  onChanged: (newValues) {
                    setState(() {
                      values = newValues;
                    });
                  },
                  activeColor: PalletsColors.mainColorBase,
                  inactiveColor: const Color.fromRGBO(125, 125, 125, 1),
                ),
                // Custom Labels
                Positioned(
                  left: startPosition + 20, // offset to center the label
                  bottom: -5,
                  child: Text(
                    '\$${values.start.round()}',
                    style: AppTextStyles.instance.textStyle14.copyWith(
                      color: PalletsColors.black50,
                    ),
                  ),
                ),
                Positioned(
                  left: endPosition,
                  bottom: -5,
                  child: Center(
                    child: Text(
                      '\$${values.end.round()}',
                      style: AppTextStyles.instance.textStyle14.copyWith(
                        color: PalletsColors.black50,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}




  //  SliderTheme(
  //                             data: SliderTheme.of(context).copyWith(
  //                               valueIndicatorTextStyle: TextStyle(
  //                                 color: Colors.white,
  //                                 fontSize: 14.sp,
  //                                 fontWeight: FontWeight.bold,
  //                               ),
  //                               valueIndicatorColor:
  //                                   PalletsColors
  //                                       .mainColorBase, // background of the label
  //                             ),
  //                             child: Slider(
  //                               value: localSliderValue,
  //                               label: localSliderValue.round().toString(),
  //                               min: 0,
  //                               max: 1000,
  //                               divisions: 1000,
  //                               activeColor: PalletsColors.mainColorBase,
  //                               onChanged: (double value) {
  //                                 setStateBottomSheet(() {
  //                                   localSliderValue = value;
  //                                 });
  //                                 setState(() {
  //                                   sliderValue = value;
  //                                 });
  //                               },
  //                             ),
  //                           ),