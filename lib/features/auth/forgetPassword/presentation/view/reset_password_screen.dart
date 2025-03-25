import 'package:flowery/features/auth/forgetPassword/presentation/view/widgets/reset_password_screen_body.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: ResetPasswordScreenBody(),
    );
  }
}
