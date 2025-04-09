import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/home/domain/use_case/GetCategoriesUseCase.dart';
import 'package:flowery/features/home/presentation/view/HomeViewBody.dart';
import 'package:flowery/features/home/presentation/viewModel/HomeCategoriesViewModel.dart';
import 'package:flowery/features/home/presentation/widgets/home_best_seller.dart';
import 'package:flowery/features/home/presentation/widgets/home_occasions_view.dart';
import 'package:flowery/features/home/presentation/widgets/view_all_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .26),

          ViewAllWidget(title: "Best seller", onTap: () {}),

          SizedBox(height: 16.h),

          HomeBestSeller(),

          SizedBox(height: 12.h),

          ViewAllWidget(title: "Occasion", onTap: () {}),

          SizedBox(height: 16.h),

          HomeOccasionsView(),
        ],
      ),
    );
    return BlocProvider(
      create:
          (context) =>
              HomeCategoriesViewModel(getIt.get<GetCategoriesUseCase>())
                ..getCategories(),
      child: HomeViewBody(),
    );
  }
}
