import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/home/presentation/view/HomeViewBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewModel/home_view_model/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    return 
       BlocProvider(
      create: (context) => getIt<HomeCubit>(),
    
    
  child: HomeViewBody(),);
  }
  
}
