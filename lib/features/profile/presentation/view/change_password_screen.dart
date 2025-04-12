import 'package:flowery/features/profile/presentation/view/widgets/change_password_screen_body.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        title: Text('Reset password'),
        titleSpacing: 0,
      ),
      body: ChangePasswordScreenBody(),
    );
  }
}
