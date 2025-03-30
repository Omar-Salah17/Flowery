import 'dart:developer';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/auth/forgetPassword/domain/use_cases/forget_password_use_case.dart';
import 'package:flowery/features/auth/forgetPassword/domain/use_cases/verify_code_use_case.dart';
import 'package:flowery/features/auth/forgetPassword/presentation/view/widgets/email_verification_screen_body.dart';
import 'package:flowery/features/auth/forgetPassword/presentation/view_model/forget_pass_cubit/forget_password_cubit.dart';
import 'package:flowery/features/auth/forgetPassword/presentation/view_model/verify_code_cubit/email_verification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  String? email;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;
    log("📥 Received arguments in didChangeDependencies: $args");

    if (args is Map<String, dynamic>) {
      final receivedEmail = args["email"];
      if (receivedEmail != null &&
          receivedEmail is String &&
          receivedEmail.isNotEmpty) {
        setState(() {
          email = receivedEmail;
        });
        log("✅ Email received in EmailVerificationScreen: $email");
      } else {
        log("❌ Invalid email argument: $receivedEmail");
      }
    } else {
      log("❌ Email argument not found or invalid: $args");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  EmailVerificationCubit(getIt.get<VerifyCodeUseCase>()),
        ),
        BlocProvider(
          create:
              (context) =>
                  ForgetPasswordCubit(getIt.get<ForgetPasswordUseCase>()),
        ),
      ],
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
        body: EmailVerificationScreenBody(email: email ?? "Email Not Found"),
      ),
    );
  }
}
