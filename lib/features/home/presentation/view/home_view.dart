import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/home/presentation/view/home_view_body.dart';
import 'package:flowery/features/home/presentation/viewModel/home_view_model/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return 
       BlocProvider(
      create: (context) => getIt<HomeCubit>(),
    
    
  child: const HomeViewBody(),);
  }
  
}
