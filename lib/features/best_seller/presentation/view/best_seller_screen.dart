import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/widgets/products_grid_view.dart';
import 'package:flowery/features/best_seller/presentation/view_model/cubits/best_seller_cubit.dart';
import 'package:flowery/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerScreen extends StatelessWidget {
  const BestSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<BestSellerCubit>()..getBestSeller(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            LocaleKeys.bestSeller.tr(),
            style: AppTextStyles.instance.textStyle24,
          ),
          centerTitle: false,
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4.h),
                    Padding(
                      padding: EdgeInsets.only(left: 28.w),
                      child: Text(
                        LocaleKeys.bloomSellers.tr(),
                        style: AppTextStyles.instance.textStyle13.copyWith(
                          color: PalletsColors.gray,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            BlocBuilder<BestSellerCubit, BestSellerState>(
              builder: (context, state) {
                if (state is BestSellerSuccess) {
                  return ProductsGridView(
                    productsList: state.model.bestSeller!,
                  );
                } else if (state is BestSellerFailure) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text(state.errorMessage)),
                  );
                }
                return SliverToBoxAdapter(
                  child: const Center(child: CircularProgressIndicator()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
