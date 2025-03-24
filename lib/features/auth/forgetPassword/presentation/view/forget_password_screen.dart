import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/auth/forgetPassword/domain/use_cases/forget_password_use_case.dart';
import 'package:flowery/features/auth/forgetPassword/presentation/view/widgets/forget_password_screen_body.dart';
import 'package:flowery/features/auth/forgetPassword/presentation/view_model/cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(getIt.get<ForgetPasswordUseCase>()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text('Password'),
          titleSpacing: 0,
        ),
        body: ForgetPasswordScreenBody(),
      ),
    );
  }
}
