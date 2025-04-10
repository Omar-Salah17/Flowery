
import 'package:flowery/features/auth/login/presentation/view/widgets/Login_screen_body.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        titleSpacing: 0,
        title: Text(
          "Login",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: LoginScreenBody(),
    );
  }
}
