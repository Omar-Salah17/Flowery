// import 'package:flowery/core/di/di.dart';
// import 'package:flowery/core/helper/spacing.dart';
// import 'package:flowery/core/utils/helper_functions/snack_bar.dart';
// import 'package:flowery/core/utils/widgets/products_grid_view.dart';
// import 'package:flowery/features/categories/domain/use_case/get_all_categories_use_case.dart';
// import 'package:flowery/features/categories/domain/use_case/get_all_sorted_products_use_case.dart';
// import 'package:flowery/features/categories/domain/use_case/get_products_by_category_use_case.dart';
// import 'package:flowery/features/categories/domain/use_case/search_use_case.dart';
// import 'package:flowery/features/categories/presentation/view/widgets/categories_title_list_view.dart';
// import 'package:flowery/features/categories/presentation/view/widgets/products_grid_view_bloc_consumer.dart';
// import 'package:flowery/features/categories/presentation/view_model/cubits/categories_cubit/categories_screen_cubit.dart';
// import 'package:flowery/features/home/presentation/widgets/tab_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CategoriesScreenBody extends StatefulWidget {
//   const CategoriesScreenBody({super.key});

//   @override
//   State<CategoriesScreenBody> createState() => _CategoriesScreenBodyState();
// }

// class _CategoriesScreenBodyState extends State<CategoriesScreenBody>
//     with TickerProviderStateMixin {
  
  
//   @override
//   void initState() {
//     final categoryCubit = context.read<CategoriesScreenCubit>();
//    categoryCubit .getAllCategories().then((_) {
//       if (categoryCubit.categories.isNotEmpty) {
//          categoryCubit.tabController = TabController(
//       length: categoryCubit.categories.length,
//       vsync: this,
//     );
       
//         final firstId = categoryCubit.categories[0].id ?? '';
//         categoryCubit.getProductsByCategory(categoryId: firstId);
//          categoryCubit.tabController.addListener(() {
//       if (!categoryCubit.tabController.indexIsChanging) {
//         final id =
//             categoryCubit
//                 .categories[categoryCubit.tabController.index]
//                 .id;
//         categoryCubit.getProductsByCategory(categoryId: id ?? '');
//       }
//     });
//         // setupCategoryTabListener();
//       }
//     });
//     super.initState();
//   }

//   // void setupCategoryTabListener() {
//   //   categoriesCubit.tabController.addListener(() {
//   //     if (!categoriesCubit.tabController.indexIsChanging) {
//   //       final id =
//   //           categoriesCubit
//   //               .categories[categoriesCubit.tabController.index]
//   //               .id;
//   //       categoriesCubit.getProductsByCategory(categoryId: id ?? '');
//   //     }
//   //   });
//   // }

  

//   @override
//   void dispose() {
//     context.read<CategoriesScreenCubit>().tabController.dispose();
//     context.read<CategoriesScreenCubit>().tabController.removeListener(() {});
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final categoryCubit = context.read<CategoriesScreenCubit>();
//     return BlocBuilder<CategoriesScreenCubit, CategoriesScreenState>(
//       buildWhen:
//           (previous, current) =>
//               previous != current && current is CategoriesSuccess ||
//               current is ProductsByCategorySuccess,
//       builder: (context, state) {
//         if (state is ProductsByCategorySuccess) {
//           return DefaultTabController(
//             length: categoryCubit.categories.length,
//             initialIndex: categoryCubit.tabController.index,
//             child: CustomScrollView(
//               slivers: [
//                 SliverToBoxAdapter(
//                   child: TabWidget(
//                     controller: categoryCubit.tabController,
//                     tabs:
//                         categoryCubit.categories
//                             .map((cat) => Tab(text: cat.name))
//                             .toList(),
//                   ),
//                 ),

//                 SliverToBoxAdapter(child: verticalSpace(10)),

//                 ProductsGridView(productsList: state.products),
//               ],
//             ),
//           );
//         } else if (state is CategoriesFailure) {
//           return Center(child: Text(state.errorMessage));
//         } else {
//           return const Center(child: CircularProgressIndicator.adaptive());
//         }
//       },
//     );
//   }
// }
