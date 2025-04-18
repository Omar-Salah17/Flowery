import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/features/auth/login/presentation/view/widgets/Login_screen_body.dart';
import 'package:flowery/generated/locale_keys.g.dart';
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
          LocaleKeys.login.tr(),
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: LoginScreenBody(),
    );
  }
}
