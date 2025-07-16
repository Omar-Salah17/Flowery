// // import 'package:easy_localization/easy_localization.dart';
// // import 'package:flowery/core/utils/app_text_styles.dart';
// // import 'package:flowery/core/utils/colors.dart';
// // import 'package:flowery/features/categories/data/models/categories_model/category.dart';
// // import 'package:flowery/features/categories/presentation/view/widgets/categories_title_widget.dart';
// // import 'package:flowery/features/categories/presentation/view_model/cubits/categories_cubit/categories_screen_cubit.dart';
// // import 'package:flowery/generated/locale_keys.g.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';

// // class CategoriesTitleListView extends StatefulWidget {
// //   const CategoriesTitleListView({super.key, required this.category});
// //   final List<Category> category;

// //   @override
// //   State<CategoriesTitleListView> createState() =>
// //       _CategoriesTitleListViewState();
// // }

// // class _CategoriesTitleListViewState extends State<CategoriesTitleListView> {
// //   // String selectedCategoryId = "all";
// //   @override
// //   Widget build(BuildContext context) {
// //     String selectedCat =
// //         context.read<CategoriesScreenCubit>().selectedCategoryId;

// //     return SizedBox(
// //       height: 40.h,
// //       child: SingleChildScrollView(
// //         scrollDirection: Axis.horizontal,
// //         child: Row(
// //           children: [
// //             GestureDetector(
// //               onTap: () {
// //                 context.read<CategoriesScreenCubit>().getProductsByCategory();
// //               },
// //               child: Column(
// //                 children: [
// //                   Text(
// //                     LocaleKeys.all.tr(),
// //                     style: AppTextStyles.instance.textStyle16.copyWith(
// //                       color:
// //                           selectedCat == LocaleKeys.all.tr()
// //                               ? PalletsColors.mainColorBase
// //                               : PalletsColors.white70,
// //                     ),
// //                   ),
// //                   Container(
// //                     height: 3.h,
// //                     width: 15.w,
// //                     decoration: BoxDecoration(
// //                       color:
// //                           selectedCat == LocaleKeys.all.tr()
// //                               ? PalletsColors.mainColorBase
// //                               : PalletsColors.white70,
// //                       borderRadius: BorderRadius.only(
// //                         topLeft: Radius.circular(100.r),
// //                         topRight: Radius.circular(100.r),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             ...widget.category.map(
// //               (cat) => GestureDetector(
// //                 onTap: () {
// //                   selectedCat = cat.id!;

// //                   context.read<CategoriesScreenCubit>().getProductsByCategory(
// //                     categoryId: cat.id,
// //                   );
// //                 },
// //                 child: CategoriesTitleWidget(
// //                   category: cat,
// //                   isSelected: selectedCat == cat.id,
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flowery/core/di/di.dart';
// import 'package:flowery/core/helper/spacing.dart';
// import 'package:flowery/core/utils/helper_functions/snack_bar.dart';
// import 'package:flowery/core/utils/widgets/products_grid_view.dart';
// import 'package:flowery/features/categories/data/models/categories_model/category.dart';
// import 'package:flowery/features/categories/domain/use_case/get_all_categories_use_case.dart';
// import 'package:flowery/features/categories/domain/use_case/get_all_sorted_products_use_case.dart';
// import 'package:flowery/features/categories/domain/use_case/get_products_by_category_use_case.dart';
// import 'package:flowery/features/categories/domain/use_case/search_use_case.dart';
// import 'package:flowery/features/categories/presentation/view_model/cubits/categories_cubit/categories_screen_cubit.dart';
// import 'package:flowery/features/home/presentation/widgets/tab_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CategoriesTitleListView extends StatefulWidget {
//   const CategoriesTitleListView({super.key, required this.category});
//   final List<Category> category;
//   @override
//   State<CategoriesTitleListView> createState() =>
//       _CategoriesTitleListViewState();
// }

// class _CategoriesTitleListViewState extends State<CategoriesTitleListView>
//     with TickerProviderStateMixin {
//  late CategoriesScreenCubit categoriesCubit;
//   @override
//   void initState() {
//   initCategoriesScreenCubit();
//     categoriesCubit.getAllCategories().then((_) {
//       if (categoriesCubit.categories.isNotEmpty) {
//         initTabController();
//         final firstId = categoriesCubit.categories[0].id;
//         categoriesCubit.getProductsByCategory(categoryId: firstId);
//         setupCategoryTabListener();
//       }
//     });
//     super.initState();
//   }

//   void initCategoriesScreenCubit()async {
//      categoriesCubit  = await CategoriesScreenCubit(
//       getIt.get<GetAllCategoriesUseCase>(),
//       getIt.get<GetProductsByCategoryUseCase>(),
//       getIt.get<GetProductsByCategoryWithSortUseCase>(),
//       getIt.get<SearchUseCase>(),
//     )..getAllCategories();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<CategoriesScreenCubit, CategoriesScreenState>(
//       buildWhen:
//           (previous, current) =>
//               previous != current &&
//               (current is ProductsByCategorySuccess ||
//                   current is CategoriesSuccess),
//       listener: (context, state) {
//         if (state is ProductsByCategoryFailure) {
//           showErrorSnackBar(context, state.errorMessage);
//         } else if (state is CategoriesFailure) {
//           showErrorSnackBar(context, state.errorMessage);
//         }
//       },
//       builder: (context, state) {
//         if (state is ProductsByCategorySuccess) {
//           return DefaultTabController(
//             length: categoriesCubit.categories.length,
//             initialIndex: categoriesCubit.tabController.index,
//             child: TabWidget(
//               controller: categoriesCubit.tabController,
//               tabs:
//                   categoriesCubit.categories
//                       .map((category) => Tab(text: category.name))
//                       .toList(),
//             ),
//           );
//         } else {
//           return const Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }

//   void initTabController() {
//     categoriesCubit.tabController = TabController(
//       length: categoriesCubit.categories.length,
//       vsync: this,
//     );
//   }

//   void setupCategoryTabListener() {
//     categoriesCubit.tabController.addListener(() {
//       if (!categoriesCubit.tabController.indexIsChanging) {
//         final id =
//             categoriesCubit.categories[categoriesCubit.tabController.index].id;
//         categoriesCubit.getProductsByCategory(categoryId: id);
//       }
//     });
//   }
// }
