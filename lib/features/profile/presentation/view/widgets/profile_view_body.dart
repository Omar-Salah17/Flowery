import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/profile/logout/domain/use_cases/logout_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [

            BlocProvider(
              create: (context) => LogoutViewModel(getIt.get<LogoutUseCase>()),
              child: Logout(),
            ),

          ],
        ),
      ),
    );
  }
}
