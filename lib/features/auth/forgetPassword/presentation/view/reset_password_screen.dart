import 'dart:developer';

import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/auth/forgetPassword/domain/use_cases/reset_password_use_case.dart';
import 'package:flowery/features/auth/forgetPassword/presentation/view/widgets/reset_password_screen_body.dart';
import 'package:flowery/features/auth/forgetPassword/presentation/view_model/reset_password_cubit/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  String? email;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;
    log(
      "📥 Received arguments in didChangeDependencies in the ResetPassword Screen: $args",
    );

    if (args is String) {
      final receivedEmail = args;
      if (receivedEmail.isNotEmpty) {
        setState(() {
          email = receivedEmail;
        });
        log("✅ Email received in ResetPassScreen: $email");
      } else {
        log("❌ Invalid email argument: $receivedEmail");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ResetPasswordCubit(getIt.get<ResetPasswordUseCase>()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text('Password'),
          titleSpacing: 0,
        ),
        body: ResetPasswordScreenBody(email: email ?? "Email Not Found"),
      ),
    );
  }
}
