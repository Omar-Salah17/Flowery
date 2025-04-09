
import 'package:flowery/features/best_seller/presentation/view/widgets/best_seller_grid_view.dart';
import 'package:flowery/features/best_seller/presentation/view_model/cubits/best_seller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/colors.dart';


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
          "Best seller",
          style: AppTextStyles.instance.textStyle24,

        ),
        centerTitle: false,
      ),
      body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
           Text(

            "Bloom with our exquisite best sellers",
            style: AppTextStyles.instance.textStyle13.copyWith(color: PalletsColors.gray),

          ),
          const SizedBox(height: 16),
          Expanded(
            child: BlocBuilder<BestSellerCubit, BestSellerState>(
              builder: (context, state) {
                if (state is BestSellerLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is BestSellerSuccess) {
                  print("---------------------${state.model.bestSeller!.length}");
                  return BestSellerGridView(bestSeller: state.model.bestSeller??[]);
                } else if (state is BestSellerFailure) {
                  return Center(child: Text(state.errorMessage));
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    ),

    )
    );
}}
