import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/profile/domain/use_case/get_user_data.dart';
import 'package:flowery/features/profile/presentation/view/cubit/profile_cubit.dart';
import 'package:flowery/features/profile/presentation/view/profile_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  var viewModel = ProfileCubit(getIt<GetUserData>());
   ProfileView({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => viewModel..getUserData(),
      child: ProfileMainScreen(),
    ); //Ma
  }
}
