import 'package:flowery/core/config/routes_name.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/features/categories/presentation/view_model/cubits/categories_cubit/categories_screen_cubit.dart';

import 'package:flowery/features/home/presentation/widgets/home_best_seller.dart';
import 'package:flowery/features/home/presentation/widgets/home_cat_view.dart';
import 'package:flowery/features/home/presentation/widgets/view_all_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/enums/request_enum.dart';
import '../viewModel/home_view_model/home_cubit.dart';
import '../viewModel/home_view_model/home_state.dart';
import '../widgets/home_occasion_view.dart';
import 'SearchBar.dart';
import 'currentUserLocation.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().fetchBestSeller();
    context.read<HomeCubit>().fetchCategories();
    context.read<HomeCubit>().fetchOccasions();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SvgPicture.asset("assets/images/Flower.svg"),
            Text(
              "Flowery",
              style: AppTextStyles.instance.textStyle20Fell.copyWith(
                color: PalletsColors.mainColorBase,
              ),
            ),
            const Spacer(),
            Expanded(flex: 10, child: CustomSearchBar()),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CurrentUserLocation(),

              ViewAllWidget(
                title: "Categories",
                onTap: () {
                  context.read<CategoriesScreenCubit>().getProductsByCategory();
                  Navigator.pushNamed(context, RoutesName.categories);
                },
              ),
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen:
                    (previous, current) =>
                        previous.categoriesState != current.categoriesState,
                builder: (context, state) {
                  switch (state.categoriesState) {
                    case RequestState.loading:
                      return const Center(child: CircularProgressIndicator());
                    case RequestState.success:
                      return HomeCatView(categories: state.categories ?? []);
                    case RequestState.error:
                      return Center(
                        child: Text(state.error ?? "Failed to load categories"),
                      );
                    default:
                      return const SizedBox.shrink();
                  }
                },
              ),

              const SizedBox(height: 16),
              ViewAllWidget(
                title: "Best seller",
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.bestSeller);
                },
              ),
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen:
                    (previous, current) =>
                        previous.bestSellerState != current.bestSellerState,
                builder: (context, state) {
                  switch (state.bestSellerState) {
                    case RequestState.loading:
                      return const Center(child: CircularProgressIndicator());
                    case RequestState.success:
                      return HomeBestSeller(product: state.bestSellers ?? []);
                    case RequestState.error:
                      return Center(
                        child: Text(
                          state.error ?? "Failed to load best sellers",
                        ),
                      );
                    default:
                      return const SizedBox.shrink();
                  }
                },
              ),

              const SizedBox(height: 16),
              ViewAllWidget(
                title: "Occasion",
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.occasionScreen);
                },
              ),
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen:
                    (previous, current) =>
                        previous.occasionState != current.occasionState,
                builder: (context, state) {
                  switch (state.occasionState) {
                    case RequestState.loading:
                      return const Center(child: CircularProgressIndicator());
                    case RequestState.success:
                      return HomeOccasionsView(
                        occasions: state.occasions ?? [],
                      );
                    case RequestState.error:
                      return Center(
                        child: Text(state.error ?? "Failed to load occasions"),
                      );
                    default:
                      return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
