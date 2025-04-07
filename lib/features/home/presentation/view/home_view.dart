import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/home/domain/use_case/GetCategoriesUseCase.dart';
import 'package:flowery/features/home/presentation/view/HomeViewBody.dart';
import 'package:flowery/features/home/presentation/viewModel/HomeCategoriesViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCategoriesViewModel(getIt.get<GetCategoriesUseCase>())..getCategories(),
        child: HomeViewBody()
    );
  }
}