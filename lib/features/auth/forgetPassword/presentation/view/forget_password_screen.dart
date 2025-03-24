import 'package:flowery/features/auth/forgetPassword/presentation/view/widgets/forget_password_screen_body.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        title: Text(
          'Password',
         
        ),
        titleSpacing: 0,
      ),
      body: ForgetPasswordScreenBody(),
    );
  }
}
